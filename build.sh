#!/bin/bash

set -xeuo pipefail

export chart_org=$(echo "$1" | cut -d/ -f1)

# The registry.gitlab.com/dedevsecops/workstation image has both Helm 2 and
# Helm 3 in it, this `helm3` specifies that we're using Helm 3 to build the
# image.

#helm3 repo add unleash --username unleash --password "${CHARTMUSEUM_PASSWORD}" https://charts.unleash.org
helm3 repo add stable https://kubernetes-charts.storage.googleapis.com/
helm3 repo update
helm3 lint "${1}"
helm3 dependency update "${1}"
helm3 package "${1}"
#helm3 push "${1}" "${chart_org}"
