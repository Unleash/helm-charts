# Unleash Kubernetes Helm Chart

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Release Charts](https://github.com/unleash/helm-charts/workflows/release-chart/badge.svg?branch=main)

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

To release new versions of the charts, you must update the chart version in the Chart.yaml file and then merge these modifications into the main branch. Following this, the workflow will detect these changes and automatically release a new version of the modified Helm chart.

## Helm repo

This repository employs a process that converts it into a Helm repository, specifically using the Helm Chart Releaser Action version 1.5.0. It leverages GitHub Pages for hosting the artifacts. Furthermore, the Unleash documentation on Helm charts (found at https://docs.getunleash.io/helm-charts) utilizes a CNAME to direct to the GitHub Pages.

The specific workflow is outlined in the file located at .github/workflows/release.yml. This workflow activates whenever there's an update to the chart version, which consequently prompts an update to the repository with the new chart version.

## Testing the helm chart locally

To test the helm chart locally, first you should set up a local k8s environment. An easy way to do this is to set up kind, you can see instructions for setting it up [here](https://github.com/bricks-software/unleash-infra-docs/blob/main/commands/k8s.md). 

Once you have your local k8s environment set up, you can run the following command to install the helm chart locally:

```
helm install --debug --generate-name . # this will install the chart using the local files provided you are in the folder that contains the chart
# To see the output of the helm chart without running it locally, you can run the following command:
helm install --debug --dry-run --generate-name .
```