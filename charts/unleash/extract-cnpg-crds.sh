#!/usr/bin/env bash
set -euo pipefail

CHART_DIR="$(dirname "$0")"
DEP_NAME="cloudnative-pg"
DEP_VERSION="0.26.1"
DEP_REPO="https://cloudnative-pg.github.io/charts"

echo "==> Adding repo (if missing)"
helm repo add cloudnative-pg "$DEP_REPO" >/dev/null 2>&1 || true
helm repo update >/dev/null

echo "==> Rendering CRDs from dependency chart"
TMP_RENDER_DIR=$(mktemp -d)
helm template \
  cnpg \
  cloudnative-pg/${DEP_NAME} \
  --version "${DEP_VERSION}" \
  --include-crds \
  --values <(echo "crds: { create: true }") \
  > "${TMP_RENDER_DIR}/rendered.yaml"

echo "==> Extracting CRDs into crds/ directory"
CRDS_DEST="${CHART_DIR}/crds"
mkdir -p "$CRDS_DEST"

# Split rendered YAML and copy only CRDs
csplit --quiet --prefix="${TMP_RENDER_DIR}/obj-" "${TMP_RENDER_DIR}/rendered.yaml" '/^---/' '{*}' || true

for f in ${TMP_RENDER_DIR}/obj-*; do
  if grep -q "kind: CustomResourceDefinition" "$f"; then
    name=$(yq '.metadata.name' "$f")
    echo "   - $name"
    cp "$f" "${CRDS_DEST}/${name}.yaml"
  fi
done

echo "==> Cleaning up"
rm -rf "$TMP_RENDER_DIR"

echo ""
echo "🎉 Rendered CNPG CRDs have been extracted into: $CRDS_DEST"
echo "They are now safe, non-templated CRDs that Helm can install."
echo ""
