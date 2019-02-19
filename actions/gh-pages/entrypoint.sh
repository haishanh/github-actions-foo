#!/bin/sh

set -e

BUILD_DIR="${BUILD_DIR:-build}"
BRANCH="${BRANCH:-gh-pages}"

cd $BUILD_DIR

# NOTE push with GITHUB_TOKEN won't trigger a gh-pages deployment
remote="https://${GITHUB_ACTOR}:${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
# remote="https://github.com/${GITHUB_REPOSITORY}.git"
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@noreply.github.com"
git add .
git status
git commit -m "First commit"
git push -u $remote HEAD:$BRANCH --force
rm -rf .git

echo "done"
