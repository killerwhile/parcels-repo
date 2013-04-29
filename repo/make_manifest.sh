#!/bin/bash

#
# This script creates a manifest.json file for any parcel files present in
# the current directory.
#
# No attempt is made to fill in the components section of the file; this can
# be done manually after the file is generated.
#

NOW="`date +%s`0000"

echo "{" > manifest.json
echo "  \"lastUpdated\": $NOW," >> manifest.json
echo "  \"parcels\": [" >> manifest.json

FIRST_PARCEL=1
for file in *.parcel; do
  sha1sum=$(sha1sum "$file" | cut -d ' ' -f 1)
  if [ ! -f "${file}.sha" ]; then  echo "${sha1sum}" > ${file}.sha; fi

  if [[ $FIRST_PARCEL -eq 1 ]]; then
    FIRST_PARCEL=0
  else
    echo "," >> manifest.json
  fi
  echo    "    {" >> manifest.json
  echo    "      \"parcelName\": \"$file\"," >> manifest.json
  echo    "      \"hash\": \"${sha1sum}\"," >> manifest.json
  echo    "      \"components\": []" >> manifest.json
  echo -n "    }" >> manifest.json
done

echo -e "\n  ]" >> manifest.json
echo "}" >> manifest.json
