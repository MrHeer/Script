#!/bin/bash

LOGSEQ_WIKI_DIR=$HOME/Source/MrHeer/LogseqWiki

cd $LOGSEQ_WIKI_DIR
if [[ -z $(git status -s) ]]; then
  echo 'git clean, do noting.'
else
  echo 'modified and/or untracked.'
  git add .
  git commit --message='script auto sync'
fi
git push
