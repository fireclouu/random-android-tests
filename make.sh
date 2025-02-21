#!/bin/bash
set -exu
set -o pipefail
# cleanups

# provide ANDROID_NDK_ROOT
NDK_PROJECT_PATH=$(pwd) $ANDROID_NDK_ROOT/ndk-build

adb push $(pwd)/libs/arm64-v8a/hello_ndk /data/local/tmp
adb shell chmod +x /data/local/tmp/hello_ndk
adb shell /data/local/tmp/hello_ndk
