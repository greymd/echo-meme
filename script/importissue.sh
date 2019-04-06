#!/bin/bash
## Require jq and GNU sed.
debug="${1-}"
cmd='sed -f- -i bin/echo-meme'
[[ "$debug" == "--debug" ]] && cmd='cat'

curl --retry 3 -L "https://api.github.com/repos/greymd/echo-meme/issues" \
  | jq -r '.[].body' \
  | grep -oE 'template:\[.+\]' \
  | sed -r 's/^template:\[(.+)\]$/\1/' \
  | sed 's/"/\\"/' \
  | sed 's|.*|/^[^#]*"@@@TEMPLATE_INSERT_HERE@@@"/i \\ \\ "&"|' \
  | eval "$cmd"
