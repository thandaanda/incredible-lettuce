#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e5a22e0800282001b056ddc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e5a22e0800282001b056ddc
curl -s -X POST https://api.stackbit.com/project/5e5a22e0800282001b056ddc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e5a22e0800282001b056ddc/webhook/build/publish > /dev/null
