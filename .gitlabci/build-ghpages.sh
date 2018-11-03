#!/bin/bash

# Taken from :
# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

set -xe # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

function doCompile {
  make doc && \
  mv doc/* out/ && \
  rm -rf doc
}

# Run our compile script
doCompile
