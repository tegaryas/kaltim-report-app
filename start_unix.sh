#!/bin/bash
cd "$(dirname "$0")"
if ! command -v fvm &> /dev/null
then
    flutter clean
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    
else
    fvm flutter clean
    fvm flutter pub get
    fvm flutter pub run build_runner build --delete-conflicting-outputs
fi

#To generate code coverages
#brew instal lcov
#genhtml -o coverage coverage/lcov.info
