#!/usr/bin/env bash
# Verify that every bottle declared in every formula actually resolves.
#
# A formula's bottle block is written by CI's "merge bottle DSL" step. When a bottle build
# fails, that step is skipped and the PREVIOUS version's block survives verbatim -- including
# its `root_url`. The formula then points every platform at a release that does not hold its
# bottles, so `brew install` 404s on all of them, not just the platform that failed to build.
# Comparing `root_url` to `url` by string is not enough; resolve the URL. ~keep
set -uo pipefail

cd "$(dirname "$0")/.." || exit 1
fail=0
checked=0

for formula in Formula/*.rb; do
	name="$(basename "$formula" .rb)"
	# Formulae quote inconsistently (crawlberg uses single quotes) and spell the source URL
	# either as /archive/v<ver>.tar.gz or /releases/download/v<ver>/..., so match both. ~keep
	version="$(sed -n "s|^[[:space:]]*version[[:space:]]*['\"]\\([^'\"]*\\)['\"].*|\\1|p" "$formula" | head -1)"
	[[ -n "$version" ]] || version="$(sed -n "s|^[[:space:]]*url[[:space:]]*['\"].*/v\\([0-9][0-9.]*\\)[/.].*|\\1|p" "$formula" | head -1)"
	root_url="$(sed -n "s|^[[:space:]]*root_url[[:space:]]*['\"]\\([^'\"]*\\)['\"].*|\\1|p" "$formula" | head -1)"

	if [[ -z "$root_url" ]]; then
		printf 'skip  %-24s no bottle block\n' "$name"
		continue
	fi
	if [[ -z "$version" ]]; then
		printf 'FAIL  %-24s bottle block present but version could not be parsed\n' "$name"
		fail=1
		continue
	fi

	while read -r tag; do
		[[ -n "$tag" ]] || continue
		url="${root_url}/${name}-${version}.${tag}.bottle.tar.gz"
		code="$(curl -sSL -o /dev/null -w '%{http_code}' --max-time 45 "$url" 2>/dev/null)"
		checked=$((checked + 1))
		if [[ "$code" == "200" ]]; then
			printf 'ok    %-24s %s\n' "$name" "$tag"
		else
			printf 'FAIL  %-24s %s -> HTTP %s\n        %s\n' "$name" "$tag" "$code" "$url"
			fail=1
		fi
	done < <(sed -n '/bottle do/,/^[[:space:]]*end/p' "$formula" |
		sed -n 's|^[[:space:]]*sha256.*[[:space:]]\([a-z0-9_]*\):[[:space:]]*"[0-9a-f]*".*|\1|p')
done

printf '\n%d bottle URL(s) checked\n' "$checked"
if [[ "$checked" -eq 0 ]]; then
	echo "ERROR: no bottle URLs were checked at all — the parser matched nothing." >&2
	exit 1
fi
exit "$fail"
