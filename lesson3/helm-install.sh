#!/usr/bin/env sh
# helm install the chart bitcoin
helm upgrade --install bitcoin-test --namespace=default charts/bitcoin -f charts/bitcoin/values.yaml --set image.tag=latest