#!/usr/bin/env bash

set -x

rm -rf output
swift test
swift run
cp -r static output
