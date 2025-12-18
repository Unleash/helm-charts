#!/bin/bash
#
# use kubeconform to validate helm generated kubernetes manifests
#

set -o errexit
set -o pipefail

echo "Running for K8S schema version: $KUBERNETES_VERSION with Kube conform: $KUBECONFORM_VERSION"
# install kubeconform
curl --silent --show-error --fail --location --output /tmp/kubeconform.tar.gz https://github.com/yannh/kubeconform/releases/download/"${KUBECONFORM_VERSION}"/kubeconform-linux-amd64.tar.gz
sudo tar -C /usr/local/bin -xf /tmp/kubeconform.tar.gz kubeconform

mkdir -p results
echo "Adding cloudnative repo so dependency building succeeds"
helm repo add cloudnative https://cloudnative-pg.github.io/charts
echo "Repo added"
CHART_DIRS="$(git diff --find-renames --name-only "$(git rev-parse --abbrev-ref HEAD)" remotes/origin/main -- charts | grep '[cC]hart.yaml' | sed -e 's#/[Cc]hart.yaml##g')"
for CHART_DIR in ${CHART_DIRS}; do
	echo "helm dependency build..."
	helm dependency build "${CHART_DIR}"

	echo "kubeconforming ${CHART_DIR##charts/} chart ..."
	helm template \
		"${CHART_DIR}" \
		-f ./"${CHART_DIR}"/ci/"${CHART_DIR##charts/}"-values.yaml | kubeconform \
		-kubernetes-version "${KUBERNETES_VERSION}" \
		--schema-location default \
		--schema-location "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json" \
		--output=tap >results/"${CHART_DIR##charts/}"-"${KUBERNETES_VERSION}"-result.tap
done

exit 0
