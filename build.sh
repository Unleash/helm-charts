#!/bin/bash

set -xeuo pipefail

export chart_org=$(echo "$1" | cut -d/ -f1)

#helm repo add unleash --username unleash --password "${CHARTMUSEUM_PASSWORD}" https://charts.unleash.org
helm repo add stable https://charts.helm.sh/stable/
helm repo update
helm lint "${1}"
helm dependency update "${1}"
helm package "${1}"
#helm push "${1}" "${chart_org}"
