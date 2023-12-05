# Unleash Kubernetes Helm Chart

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add unleash https://docs.getunleash.io/helm-charts
```

You can then run `helm search repo unleash` to see the charts.

## Versions

- 1.x includes Unleash v3.x
- 2.x includes Unleash v4.x

## Kubernetes support strategy

We'll build this repo on all k8s versions that have not reached End of Life according to the [Kubernetes support period](https://kubernetes.io/releases/patch-releases/#support-period).


## Contributing

The source code of all [unleash](https://unleash.github.io/) [Helm](https://helm.sh) charts can be found on Github: <https://github.com/unleash/helm-charts/>

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->

We'd love to have you contribute! Please refer to our [contribution guidelines](https://github.com/unleash/helm-charts/blob/main/CONTRIBUTING.md) for details.

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->

[Apache 2.0 License](https://github.com/unleash/helm-charts/blob/main/LICENSE).

## Helm charts build status

![Release Charts](https://github.com/unleash/helm-charts/workflows/release-chart/badge.svg?branch=main)

## Releasing the charts

In order to release the charts you need to bump the chart version in Chart.yaml and merge the changes to main. The workflow will pick up on these
changes and release a new version of the helm chart you changed.