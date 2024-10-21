#!/usr/bin/env bash

docker compose exec \
    jupyter \
    /home/jovyan/gen-passwd.sh
