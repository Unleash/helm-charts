# Unleash Edge

Unleash Edge offers a way to use Unleash in client-side applications, such as single page and native apps. It can also be used for server-side applications, taking the place of the main Unleash server. This has the added benefit of not triggering database operations for every client refresh.

See the [reference documentation](https://docs.getunleash.io/reference/unleash-edge) for more on the reasons why you might want to deploy Edge in your cluster.

This chart bootstraps an [Unleash Edge](https://github.com/Unleash/unleash-edge) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

No extra configuration is needed besides pointing edge to an Upstream URL.

## Prerequisites

- Kubernetes 1.23+
- Helm 3+

## Get Repo Info

```console
helm repo add unleash https://docs.getunleash.io/helm-charts
helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install unleash-edge unleash/unleash-edge
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Dependencies

You'll need a running Unleash instance in your kubernetes cluster, or a hosted instance (Get one at https://www.getunleash.io).

## Uninstall Chart

```console
helm uninstall unleash-edge
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade unleash-edge unleash/unleash-edge --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See description of configuration in the values.yaml
