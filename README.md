# python-tools

Python formatting and analysis with:

- Black
- Isort
- Flake8 with Bugbear, Docstrings and Darglint

YAML, JSON and Markdown formatting with:

- Prettier

Checkout [`entrypoint.sh`](./entrypoint.sh) for all supported commands.

## Build

```sh
docker build -t python tools .
```

## Check

```sh
docker run --rm -v /your/python/project:/src python-tools check all
```

## Format

```sh
docker run --rm -v /your/python/project:/src python-tools format all
```
