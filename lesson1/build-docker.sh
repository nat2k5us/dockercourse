#!/usr/bin/env sh

curl -OL https://bitcoin.org/bin/bitcoin-core-22.0/SHA256SUMS
export hash=$(cat SHA256SUMS | grep 'bitcoin-22.0-x86_64-linux-gnu.tar.gz' | awk -F ' ' '{ print $1 }')
echo "$hash"
docker build --build-arg bitcoin_hash="$hash" -t bitcointest .

