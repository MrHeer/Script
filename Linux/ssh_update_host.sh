#!/usr/bin/env sh

HOST=$1

ssh-keygen -R "${HOST}"
ssh-keyscan -H "${HOST}" >> ~/.ssh/known_hosts
