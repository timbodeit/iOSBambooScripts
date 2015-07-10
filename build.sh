#!/bin/bash

./setBuildNumber.rb

# Clean artifacts folder
rm -rf ./artifacts
mkdir ./artifacts

# Generate ipa and dsyms
configuration=${bamboo_configuration_name-Release}
set -o pipefail
ipa build --scheme ${bamboo_scheme_name}    \
          --clean                           \
          --archive                         \
          --destination ./artifacts         \
          --ipa "${bamboo_scheme_name}.ipa" \
          --configuration $configuration    \
          --verbose                         \
    | xcpretty

