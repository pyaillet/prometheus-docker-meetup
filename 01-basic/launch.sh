#!/bin/sh

docker-compose up -d

if [ $(uname) == "Darwin" ]; then
    open http://localhost:9090
    open http://localhost:9090/metrics
fi