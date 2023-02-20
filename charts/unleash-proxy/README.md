# The Unleash Proxy

The Unleash proxy offers a way to use Unleash in client-side applications, such as single-page and native apps.

The Unleash proxy sits between the Unleash API and your client-side SDK and does the evaluation of feature toggles for your client-side SDK. This way, you can keep your configuration private and secure, while still allowing your client-side apps to use Unleash's features.

The proxy offers three important features:

- **Performance**: The caches all features in memory and can run close to your end-users. A single instance can able to handle thousands of requests per second, and you can easily scale it by adding additional instances.
- **Security**: The proxy evaluates the features for the user on the server-side and by default only exposes results for features that are **enabled** for the specific user. No feature toggle configuration is ever shared with the user.
- **Privacy**: If you run the proxy yourself, Unleash will never get any data on your end-users: no user ids, no IPs, no nothing.


You can read more about the proxy [in the Unleash proxy reference documentation](https://docs.getunleash.io/reference/unleash-proxy).

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

See description of configuration in [values.yaml](./values.yaml)