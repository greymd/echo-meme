#!/bin/bash
## Require jq and GNU sed.
curl --retry 3 -L "https://api.github.com/repos/greymd/echo-meme/issues" \
  | jq -r '.[].body' \
  | grep -E 'template:\[.+\]' \
  | sed -r 's/^template:\[(.+)\]$/\1/' \
  | sed 's/"/\\"/' \
  | sed 's|.*|/^[^#]*"@@@TEMPLATE_INSERT_HERE@@@"/i \\ \\ "&"|' \
  | sed -f- -i bin/echo-meme
