#!/bin/bash
./setBuildNumber.rb

rm -rf ./artifacts
mkdir ./artifacts

xcodebuild clean archive -scheme ${bamboo_scheme_name} -archivePath ./artifacts/${bamboo_scheme_name}.xcarchive
xcodebuild -exportArchive -exportFormat ipa -archivePath "./artifacts/${bamboo_scheme_name}.xcarchive" -exportPath "./artifacts/${bamboo_scheme_name}.ipa" -exportWithOriginalSigningIdentity

zip -r $bamboo_scheme_name".xcarchive.zip" $bamboo_scheme_name".xcarchive"
zip -r $bamboo_scheme_name".app.dSYM.zip"  $bamboo_scheme_name".xcarchive/dSYMs/"$bamboo_scheme_name".app.dSYM"
