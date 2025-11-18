# Contributing to Unleash's Helm charts

## Getting started

Before you begin:

- Have you read the [code of conduct](https://github.com/Unleash/unleash/blob/main/CODE_OF_CONDUCT.md)?
- Check out the [existing issues](https://github.com/Unleash/helm-charts/issues)

### Don't see your issue? Open one

If you spot something new, [open an issue](https://github.com/unleash/Unleash/issues/new). We'll use the issue to have a conversation about the problem you want to fix. If the issue goes without any activity for a while, it will be marked as 'stale' by a bot. If that happens, please don't hesitate to reopen it if it still needs to be addressed.

### Ready to make a change? Fork the repo

Fork using GitHub Desktop:

- [Getting started with GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/getting-started-with-github-desktop) will guide you through setting up Desktop.
- Once Desktop is set up, you can use it to [fork the repo](https://docs.github.com/en/desktop/contributing-and-collaborating-using-github-desktop/cloning-and-forking-repositories-from-github-desktop)!

Fork using the command line:

- [Fork the repo](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo#fork-an-example-repository) so that you can make your changes without affecting the original project until you're ready to merge them.

Fork with [GitHub Codespaces](https://github.com/features/codespaces):

- [Fork, edit, and preview](https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/creating-a-codespace) using [GitHub Codespaces](https://github.com/features/codespaces) without having to install and run the project locally.

### Make your update:

Make your changes to the file(s) you'd like to update.

### Running superlinter locally
If you're struggling with getting CI to successfully lint your code, you can run superlinter locally to see what's wrong. To do this, you need to have Docker installed on your machine. Once you have Docker installed, you can run the following command:

```bash
docker run --rm \
    -e RUN_LOCAL=true \
    --env-file ".github/super-linter.env" \
    -v "$(pwd)":/tmp/lint \
    ghcr.io/super-linter/super-linter:latest
```

### Open a pull request

When you're done making changes and you'd like to propose them for review by opening a pull request.

### Submit your PR & get it reviewed

- Once you submit your PR, others from the Unleash community will review it with you. The first thing you're going to want to do is a self review.
- After that, we may have questions, check back on your PR to keep up with the conversation.
- Did you have an issue, like a merge conflict? Check out GitHub's [git tutorial](https://lab.github.com/githubtraining/managing-merge-conflicts) on how to resolve merge conflicts and other issues.
- We do have bots monitoring our open PRs, which will mark PRs as stale if they haven't had any activity within 30 days and close stale issues without activity after another amount days. If you feel this was in error, please reach out to us or reopen the issue with more information.

### Your PR is merged!

Congratulations! The whole Unleash community thanks you. :sparkles:
