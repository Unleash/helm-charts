# Unleash

Unleash is a open source feature flag & toggle system, that gives you a great overview over all feature toggles across all your applications and services.
It comes with official client implementations for Java, Node.js, Go, Ruby, Python and .NET Core.

This chart bootstraps a [Unleash](https://github.com/Unleash/unleash) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- Helm 3+

## Get Repo Info

```console
helm repo add unleash https://docs.getunleash.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install unleash unleash/unleash
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Dependencies

By default this chart installs additional, dependent charts:

- [bitnami/postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql)

To disable the dependency during installation, set `postgresql.enabled` to `false`.

_See [helm dependency](https://helm.sh/docs/helm/helm_dependency/) for command documentation._

### Using a separate database instance

While you can use this chart with the bundled Postgres, we recommend that you run a separate instance instead.

We currently don't have a direct upgrade path for the Postgres dependency. Further, it doesn't have any backups and isn't optimized for persistent storage.

## Uninstall Chart

```console
helm uninstall unleash
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade unleash unleash/unleash --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See description of configuration in the values.yaml
