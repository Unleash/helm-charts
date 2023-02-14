# The Unleash Proxy

The Unleash Proxy simplifies integration with frontend & native applications running in the context of a specific user. The Unleash proxy sits between the proxy SDK and the 
Unleash API and ensures that your internal feature toggle configuration is not 
exposed to the world. 

The proxy offers:

- **High performance** - a single proxy instance can handle thousands req/s, and can be horizontally scaled. 
- **Privacy for end-users** - Your end users are not exposed to the unleash API and can be hosted by you This ensures no user data (userId, IPs, etc) is shared. 
- **Secure** - It is controlled by you, and can hosted on your domain. In addition no feature toggle configuration is shared with the user, only evaluated toggles. 


You can read more about [the proxy in our documentation](https://docs.getunleash.io/sdks/unleash-proxy)

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
helm install unleash-proxy unleash/unleash-proxy
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Dependencies

The functionality of unleash-proxy is dependent on having a running Unleash installation, however, this chart does not have any other dependencies and can be configured to use an in-cluster Unleash instance or an instance hosted somewhere else. See [configuration](#configuration)

## Uninstall Chart

```console
helm uninstall unleash-proxy
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade unleash-proxy unleash/unleash-proxy --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

See description of configuration in the values.yaml