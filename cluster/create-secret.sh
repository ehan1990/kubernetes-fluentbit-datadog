#!/bin/bash

kubectl delete secret datadog --ignore-not-found

kubectl create secret generic datadog \
    --from-literal=api_key=${API_KEY}
