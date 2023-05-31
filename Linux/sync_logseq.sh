#!/bin/bash

LOGSEQ_WIKI_DIR=$HOME/Documents/LogseqWiki

cd "$LOGSEQ_WIKI_DIR" || exit
if [[ -z $(git status -s) ]]; then
  echo 'git clean, nothing to add.'
else
  echo 'modified and/or untracked. adding...'
  git add .
  echo 'comming...'
  git commit --message='sync script auto commit'
fi
echo 'push to remote...'
git push
