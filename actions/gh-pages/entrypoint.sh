#!/bin/sh

set -e

PUBLISH_DIR="${PUBLISH_DIR:-public}"
BRANCH="${BRANCH:-gh-pages}"

cd $PUBLISH_DIR

# NOTE push with GITHUB_TOKEN won't trigger a gh-pages deployment
remote="https://${TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git init
git config user.name "${GITHUB_ACTOR}"
git config user.email "${GITHUB_ACTOR}@noreply.github.com"
git add .
git status
git commit -m "First commit"
git push -f $remote HEAD:$BRANCH
rm -rf .git

echo "done"
