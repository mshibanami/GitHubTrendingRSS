#!/usr/bin/env bash

set -x

rm -rf output
swift run
cp -r static output
