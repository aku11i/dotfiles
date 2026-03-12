#!/bin/bash

set -e

nix profile install \
  nixpkgs#devenv \
  nixpkgs#direnv \
  nixpkgs#nodejs_24 \
  nixpkgs#pnpm
