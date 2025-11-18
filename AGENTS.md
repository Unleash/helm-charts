# Repository Guidelines

## Project Structure & Module Organization

- Helm charts live in `charts/`: `unleash`, `unleash-proxy`, and `unleash-edge`. Each chart contains `Chart.yaml`, `values.yaml`, `templates/`, `templates/tests/`, and `examples/` for sample overrides.
- Chart-specific CI values are under `charts/<chart>/ci/*.yaml`; CRDs for the main chart sit in `charts/unleash/crds/`.
- Generated schema test outputs land in `results/` when running kubeconform locally or in CI.

## Build, Test, and Development Commands

- Lint a chart with Helm: `helm lint charts/unleash` (adjust chart path as needed).
- Chart Testing (used in CI): `ct lint --config .github/ct.yaml` and `ct install --config .github/ct.yaml` (requires kind and Helm; installs changed charts listed by `ct list-changed`).
- Render manifests for quick inspection: `helm template charts/unleash -f charts/unleash/ci/unleash-values.yaml`.
- Schema validation (mirrors CI): `.github/kubeconform.sh` with `KUBERNETES_VERSION` set; ensures Bitnami repo is added for dependencies.
- Super-linter locally (needs Docker): `docker run --rm -e RUN_LOCAL=true --env-file ".github/super-linter.env" -v "$(pwd)":/tmp/lint ghcr.io/super-linter/super-linter:latest`.
- Dry-run install for smoke checks: `helm install --debug --dry-run --generate-name charts/unleash`.

## Coding Style & Naming Conventions

- YAML uses two-space indentation; prefer lowercase, hyphen-separated keys and filenames.
- Keep Helm templates minimal and reuse existing helper templates where possible; document new values in `values.yaml` and the chart `README.md`.
- Bump chart `version` (and `appVersion` if applicable) in `Chart.yaml` with chart changes; update `Chart.lock` when dependency versions change.

## Testing Guidelines

- Add or adjust `templates/tests/` if behavior changes require Helm tests; keep CI values in sync so `ct install` passes.
- Run `ct lint` before opening a PR; use `helm template` plus `.github/kubeconform.sh` for schema confidence against supported Kubernetes versions.
- If adding new values, provide a minimal example under `examples/` and ensure defaults keep templates rendering successfully without overrides.

## Commit & Pull Request Guidelines

- Use clear, imperative commit subjects (short scope tags like `chore(lint): …` are common but not required).
- Each chart change should include a version bump, updated docs, and mention of validation commands run.
- PRs should describe the change, reference related issues, and note any kubeconform/ct results or screenshots of rendered resources when relevant.
