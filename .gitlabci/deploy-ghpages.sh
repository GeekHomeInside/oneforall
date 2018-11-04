#!/bin/bash

# Taken from :
# https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

set +x #
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

function doCompile () {
  make doc && \
  mv doc/* out/ && \
  rm -rf doc
}

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$CI_COMMIT_REF_NAME" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build."
    mkdir out
    doCompile
    exit 0
fi

# Clone Github Repository
git clone https://guiadco:$GITHUB_ACCESS_TOKEN@github.com/guiadco/geekhomeinside.git build

# Go inside build Folder
cd build

# Install virtualenv prerequisite
pip install --user virtualenv

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
SHA=`git rev-parse --verify HEAD`

# Clone the existing gh-pages for this repo into doc/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
git clone $REPO out
cd out
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
git reset --hard
cd ..

# Clean out existing contents
rm -rf out/**/* || exit 0

# Run our compile script
doCompile

# Now let's go have some fun with the cloned repo
cd out
git config user.name "Gitlab CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# If there are no changes to the compiled out (e.g. this is a README update) then just bail.
if git diff --quiet; then
    echo "No changes to the output on this push; exiting."
    exit 0
fi

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
git add -A .
git commit -m "Build from: $CI_SERVER_NAME $CI_PIPELINE_ID & Deploy to GitHub Pages: ${SHA}"
git push $SSH_REPO $TARGET_BRANCH
