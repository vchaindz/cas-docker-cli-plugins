#! /usr/bin/env bash

set -e

if [[ "$1" == "docker-cli-plugin-metadata" ]]; then
  cat << CUT
{
  "SchemaVersion": "0.1.0",
  "Vendor": "github.com/codenotary/cas",
  "Version": "v1.0.2",
  "ShortDescription": "cas notarize the container image on the cas.codenotary.com platform including SBOM (Software Bill of Materials)"
}
CUT
exit
fi


if [ "$#" -lt 2 ]; then
  echo "arg missing to notarize the container image"
  exit 1
fi

if [[ -x "cas" ]]; then
  echo "cas not found, please refer to installation page https://cas.codenotary.com"
  exit 1
fi

cas n --bom docker://${@:2}
