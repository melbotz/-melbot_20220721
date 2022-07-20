#!/usr/bin/env bash

# git push github
git remote | xargs -L1 git push --all
npm publish

#RELAY="ws://nostr.rocks:1617"
RELAY=$(git config gitmark.relay)
GENESIS="gitmark:48cb6f5e17648c837b52f3208f3c86ee630320aa08d6b367696d5d5c628e22c7:0"
CREATED=1658354484


git-mark-list $(git config gitmark.secret) --genesis "${GENESIS}" --created "${CREATED}" -g $(cat package.json | jq -r '.repository.url')  | websocat $RELAY
