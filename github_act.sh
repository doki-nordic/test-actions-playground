#!/bin/bash

set -e

rm -Rf _temp_repo
mkdir _temp_repo
cd _temp_repo
git init .
mkdir -p .github/workflows
cp ../.github/workflows/build_the_file.yml .github/workflows
cp -R ../dir_to_process/* ./
echo TODO: Copy other tools needed by the action to avoid unneccessary repo checkout
git add *
git add .github
git status
git commit -m "temp: Send file for testing"
git branch build-the-test-file
git checkout build-the-test-file
git remote add tester https://doki-nordic@github.com/doki-nordic/test-actions-playground.git
git push --force --set-upstream tester build-the-test-file

