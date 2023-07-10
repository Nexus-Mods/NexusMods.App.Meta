# Reusable Workflows

These workflows can be used in different repositories. See [reusing workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows#using-outputs-from-a-reusable-workflow) for more details.

## `validate-codecov.yaml`

Source: [`validate-codecov.yaml`](./validate-codecov.yaml)

Usage:

```yaml
jobs:
  validate:
    uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/validate-codecov.yaml@main
```

You can also change the `config-file` input. It's `codecov.yaml` by default:

```yaml
jobs:
  validate:
    uses: Nexus-Mods/NexusMods.App.Meta/.github/workflows/validate-codecov.yaml@main
    with:
      config-file: .github/codecov.yaml
```
