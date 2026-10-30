#!/usr/bin/env bats

setup() {
  bats_load_library xberg-bats
  xberg_setup
  REPO_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd -P)"
  mkdir -p "$XBERG_WORK/scripts" "$XBERG_WORK/Formula"
  cp "$REPO_ROOT/scripts/verify-bottle-urls.sh" "$XBERG_WORK/scripts/"
}

formula() {
  cat >"$XBERG_WORK/Formula/example.rb" <<'RUBY'
class Example < Formula
  version "1.2.3"
  bottle do
    root_url "https://example.test/releases/v1.2.3"
    sha256 arm64_sonoma: "abcd"
    sha256 x86_64_linux: "ef01"
  end
end
RUBY
}

@test "bottle build installs before packaging the requested formula" {
  xberg_stub_trace brew
  run bash "$REPO_ROOT/scripts/build-bottles.sh"
  xberg_assert_status 0
  xberg_assert_trace $'brew install --build-bottle xberg\nbrew bottle xberg'
}

@test "bottle build stops when installation fails" {
  xberg_stub brew 'printf "%s\n" "$*" >>"$XBERG_TRACE"; exit 23'
  run bash "$REPO_ROOT/scripts/build-bottles.sh"
  xberg_assert_status 23
  xberg_assert_trace 'install --build-bottle xberg'
}

@test "bottle URL verification resolves both platform URLs" {
  formula
  xberg_stub curl 'printf "%s\n" "${@: -1}" >>"$XBERG_TRACE"; printf 200'
  run bash "$XBERG_WORK/scripts/verify-bottle-urls.sh"
  xberg_assert_status 0
  xberg_assert_trace $'https://example.test/releases/v1.2.3/example-1.2.3.arm64_sonoma.bottle.tar.gz\nhttps://example.test/releases/v1.2.3/example-1.2.3.x86_64_linux.bottle.tar.gz'
  xberg_assert_output_contains '2 bottle URL(s) checked'
}

@test "bottle URL verification rejects a missing bottle" {
  formula
  xberg_stub curl 'printf 404'
  run bash "$XBERG_WORK/scripts/verify-bottle-urls.sh"
  xberg_assert_status 1
  xberg_assert_output_contains 'HTTP 404'
  xberg_assert_output_contains '2 bottle URL(s) checked'
}

@test "bottle URL verification refuses a zero-work pass" {
  printf 'class Example < Formula\nend\n' >"$XBERG_WORK/Formula/example.rb"
  xberg_stub_curl_offline
  run bash "$XBERG_WORK/scripts/verify-bottle-urls.sh"
  xberg_assert_status 1
  xberg_assert_output_contains 'no bottle URLs were checked'
}

@test "shared helper sync rejects a mutable source ref before downloading" {
  xberg_stub_curl_offline
  run env BATS_LIB_REF=main bash "$REPO_ROOT/scripts/sync-bats-lib.sh" --check
  xberg_assert_status 1
  xberg_assert_output_contains 'not'
}

@test "shared helper sync copies pinned bytes and detects drift" {
  xberg_stub_curl_file "$REPO_ROOT/tests/lib/xberg-bats/load.bash"
  export BATS_LIB_REF=v1.29.0 BATS_LIB_DEST="$XBERG_WORK/lib"
  run bash "$REPO_ROOT/scripts/sync-bats-lib.sh" sync
  xberg_assert_status 0
  run bash "$REPO_ROOT/scripts/sync-bats-lib.sh" --check
  xberg_assert_status 0
  printf '\nchanged\n' >>"$BATS_LIB_DEST/load.bash"
  run bash "$REPO_ROOT/scripts/sync-bats-lib.sh" --check
  xberg_assert_status 1
  xberg_assert_output_contains 'has drifted'
}
