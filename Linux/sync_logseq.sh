#!/bin/bash

cd /Users/mrheer/Documents/LogseqWiki
if [[ -z $(git status -s) ]]; then
  echo 'git clean, do noting.'
else
  echo 'modified and/or untracked.'
  git add .
  git commit --message='script auto sync'
fi
git push
