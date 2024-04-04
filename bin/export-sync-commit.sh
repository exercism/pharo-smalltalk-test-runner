#!/usr/bin/env sh

export SHA_OR_BRANCH=$(sed -n '3p' Pharo-sync-commit)

if [ -n "$GITHUB_ACTIONS" ]; then
    echo "SHA_OR_BRANCH=${SHA_OR_BRANCH}" >> $GITHUB_ENV
    echo "SHA_OR_BRANCH=${SHA_OR_BRANCH}" >> $GITHUB_OUTPUT
fi
