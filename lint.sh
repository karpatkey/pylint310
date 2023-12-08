#!/bin/bash
set -xe

black --fast --check "$@"
isort --check "$@"
flake8 "$@"
