#!/bin/bash

GIT_REVISION=$(git rev-parse --verify HEAD)
BUILD_TIME="$(date --iso-8601=seconds --utc)"

echo "GIT_REVISION: $GIT_REVISION"
echo "BUILD_TIME: $BUILD_TIME"

rm -rf ./generated_docs
mkdir ./generated_docs
cp ./template.html ./generated_docs/index.html

sed -i "s/GIT_REVISION/${GIT_REVISION}/g" ./generated_docs/index.html
sed -i "s/BUILD_TIME/${BUILD_TIME}/g" ./generated_docs/index.html

echo "Result:"
cat ./generated_docs/index.html

echo "== FINISHED =="