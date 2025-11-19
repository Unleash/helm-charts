# Unleash Enterprise

Unleash is a feature flag & toggle system, that gives you a great overview over all feature toggles across all your applications and services.

This chart bootstraps an [Unleash-Enterprise](https://github.com/bricks-software/unleash-enterprise) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.31+
- Helm 3+

## Get Repo Info

```console
helm repo add unleash https://docs.getunleash.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install unleash-enterprise unleash/unleash-enterprise
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Dependencies

By default this chart installs additional, dependent charts:

- [cloudnative-pg](https://cloudnative-pg.github.io/charts)

If you already use cloudnative-pg and only need this chart to manage your Cluster resource for you, set `cnpg.cluster.enabled` to `true` in your values. In addition if you want this chart to also install the operator for you, set `cloudnative-pg.enabled` to `true` as well.

_See [helm dependency](https://helm.sh/docs/helm/helm_dependency/) for command documentation._

### Using a separate database instance

While you can use this chart with the bundled Postgres, we recommend that you run a separate instance instead.

We currently don't have a direct upgrade path for the Cloud-Native PostgreSQL dependency. Furthermore, we do not currently configure any backups, though persistent storage is configured for the managed CNPG cluster.

## Uninstall Chart

```console
helm uninstall unleash-enterprise
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade unleash-enterprise unleash/unleash-enterprise --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See description of configuration in the values.yaml
