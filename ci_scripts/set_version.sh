#!/bin/sh

echo "==== Set version"

echo "Fetching tags"
git fetch --tags

versionNumber=$(git tag --list --sort=-version:refname | grep -E "[0-9]+.[0-9]+.[0-9]+" | head -n 1)

echo "Set Version '${versionNumber}' in the config file"
sed -i '' "s/MARKETING_VERSION = .*/MARKETING_VERSION = $versionNumber/" ../DemoApp/Configuration/BaseConfig.xcconfig
