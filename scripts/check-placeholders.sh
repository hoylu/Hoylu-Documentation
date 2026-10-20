#!/bin/sh
# Fails if hoylu-v4-docs.html contains leftover regex backreferences (\1, \2, \n, ...).
# Run before publishing: sh scripts/check-placeholders.sh
cd "$(dirname "$0")/.." || exit 1
FILE="hoylu-v4-docs.html"
if grep -n -E '\\[1-9nrt]' "$FILE"; then
  printf '%s\n' "ERROR: $FILE contains unresolved placeholders (\\1, \\n, ...) on the lines above. Do not publish." >&2
  exit 1
fi
printf '%s\n' "OK: no leftover escape placeholders in $FILE"
