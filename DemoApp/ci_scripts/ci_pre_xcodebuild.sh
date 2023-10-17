#!/bin/sh

if [[ $CI_XCODEBUILD_ACTION = 'build-for-testing' ]];
then
    echo "linting the code..."

    swiftlint --version
    swiftlint --strict $CI_PRIMARY_REPOSITORY_PATH --config $CI_PRIMARY_REPOSITORY_PATH/.swiftlint.yml
else
    echo "Skip linting for $CI_XCODEBUILD_ACTION"
fi
