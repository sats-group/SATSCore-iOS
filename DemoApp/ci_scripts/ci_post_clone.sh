#!/bin/sh

case $CI_XCODEBUILD_ACTION in
    "build-for-testing")
        echo "Install Swiftlint"
        brew install swiftlint
    ;;

    "archive")
        ./set_version.sh
        ./set_changelog.sh
    ;;

    *)
        echo "No actions for $CI_XCODEBUILD_ACTION"
    ;;
esac
