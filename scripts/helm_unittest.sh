#!/usr/bin/env bash

# This script uses https://github.com/helm-unittest/helm-unittest
# to run unit tests for our Helm Chart templates.
#
# It uses the Docker image to make it easier to run on local machines without
# having to manage the binary and its correct version. Note that if it ever
# appears in https://mise.jdx.dev/registry.html, we can add an entry in .mise.toml.
#
# Dependencies:
# - docker
#
# Usage:
#  ./scripts/helm_unittest.sh

version=${VERSION:-3.17.1-0.7.2}

docker run \
  -it --rm \
  -v $(pwd):/apps \
  helmunittest/helm-unittest:${version} charts/*
