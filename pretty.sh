#!/bin/bash
set -xe

black --fast "$@"
isort "$@"
