#!/bin/sh

echo "==== Set changelogs"

echo "- 1. Setup ENV"
echo 'export GEM_HOME=$HOME/gems' >> ~/.bash_profile
echo 'export PATH=$HOME/gems/bin:$PATH' >> ~/.bash_profile
export GEM_HOME=$HOME/gems
export PATH="$GEM_HOME/bin:$PATH"

echo "- 2. Install pr_changelog"
gem install pr_changelog --install-dir $GEM_HOME

echo "==== Set changelogs"

versionStringFrom=$(git tag --list --sort=-version:refname | grep -E "[0-9]+.[0-9]+.[0-9]+" | head -n 2)
versionStringTo=$(git tag --list --sort=-version:refname | grep -E "[0-9]+.[0-9]+.[0-9]+" | head -n 1)

# Create TestFlight directory if needed
mkdir -p ../TestFlight

# Execute pr_changelog in the right directory to respect
# the config file
(
    cd ..
    pr_changelog --format pretty $versionStringFrom $versionStringTo > TestFlight/WhatToTest.en-US.txt
)
