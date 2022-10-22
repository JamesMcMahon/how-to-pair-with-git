#!/usr/bin/env bash

mkdir git-test
cd git-test
git init
echo "test 1" > file1
git add -A
git commit -m "heyo"
