# Python 3.10 linter image

Using the Github workflow [buildpush](.github/workflows/buildpush.yml), it builds a docker image with `black`, `isort`
and `flake8`, and push it to a registry.


## How to be used

### CI

Using Github workflows, add a new file `.github/workflows/linting.yml` like
```yaml
name: Linting

on: [push]

jobs:
  Linting:

    runs-on: self-hosted  # or ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Check black isort and flake8
        uses: docker://ghcr.io/maurob/pylint310
        with:
          args: path1 path2 ...  # paths to check linting
```

### Development

Run the default linting check
```sh
docker run --rm -v $PWD:/repo:ro ghcr.io/maurob/pylint310 path1 path2
```
or apply code formating using your current user
```sh
docker run --rm -v $PWD:/repo --user $(id -u):$(id -g) --entrypoint /pretty.sh ghcr.io/maurob/pylint310 path1 path2
```
