#!/bin/bash

set -ev

./Scripts/set-travis-tag-to-latest.sh

pod --version

echo Getting CocoaPods environment...

pod env

echo Done getting CocoaPods environment.

# Lint the podspec to check for errors. Don't call `pod spec lint`, because we want it to evaluate locally
pod lib lint --verbose

./Scripts/unset-travis-tag.sh