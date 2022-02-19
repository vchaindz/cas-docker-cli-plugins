#! /usr/bin/env bash

set -e

if [[ "$1" == "docker-cli-plugin-metadata" ]]; then
  cat << CUT
{
  "SchemaVersion": "0.1.0",
  "Vendor": "github.com/codenotary/cas",
  "Version": "v1.0.2",
  "ShortDescription": "cas authenticate the container image including SBOM (Software Bill of Materials)"
}
CUT
exit
fi

if [ "$#" -lt 2 ]; then
  echo "arg missing to authenticate the container image including SBOM (Software Bill of Materials)"
  exit 1
fi

if [[ -x "cas" ]]; then
  echo "cas not found, please refer to installation page https://cas.codenotary.com"
  exit 1
fi

cas a --bom docker://${@:2}
