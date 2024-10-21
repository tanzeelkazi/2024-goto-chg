#!/usr/bin/env bash

docker compose exec \
    -e BLOGPOST_SHELL=y \
    jupyter \
    /bin/bash
