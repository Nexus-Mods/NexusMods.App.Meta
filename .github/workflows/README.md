# Reusable Workflows

These workflows can be used in different repositories. See [reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows#using-outputs-from-a-reusable-workflow) for more details.

## Validate codecov.yaml

Source: [`validate-codecov.yaml`](./validate-codecov.yaml)

Usage:

```yaml
validate:
  uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/validate-codecov.yaml@main
```

You can also change the `config-file` input. It's `codecov.yaml` by default:

```yaml
validate:
  uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/validate-codecov.yaml@main
  with:
    config-file: .github/codecov.yaml
```

## .NET build and test

Source: [`dotnet-build-and-test.yaml`](./dotnet-build-and-test.yaml)

Usage:

```yaml
build-and-test:
  uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/dotnet-build-and-test.yaml@main
  with:
    # flags are comma separated
    codecov-flags: ",clean_environment_tests"
```

## Publish NuGet Packages

Source: [`publish-nuget-packages.yaml`](./publish-nuget-packages.yaml)

Usage:

```yaml
publish:
  needs: get-version
  uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/publish-nuget-packages.yaml@main
  with:
    version: ${{ needs.get-version.outputs.version }}
    use-nuget: true
    use-github: false
  secrets:
    NUGET_API_KEY: ${{ secrets.NUGET_KEY }}
```

## MkDocs build and publish

Source: [`mkdocs-build-and-deploy.yaml`](./mkdocs-build-and-deploy.yaml)

Usage:

```yaml
jobs:
  build-and-deploy:
    permissions:
      contents: read
      pages: write
      id-token: write
    uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/mkdocs-build-and-deploy.yaml@main
```

## Match files from meta-repository

Source: [`compare-to-meta.yaml`](./compare-to-meta.yaml)

Usage:

```yaml
match-meta:
  uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/compare-to-meta.yaml@main
```

## Update submodules

Source: [`update-from-meta.yaml`](./update-from-meta.yaml)

Usage:

```yaml
permissions:
  pull-requests: write
  contents: write

jobs:
  update:
    uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/update-from-meta.yaml@main
```
