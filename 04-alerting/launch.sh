#!/bin/sh

docker-compose up --build -d

if [ $(uname) == "Darwin" ]; then
    open http://localhost:8081
    open http://localhost:9090/rules
    open http://localhost:9090/alerts
    open http://localhost:9093/#/alerts
    sleep 3
    open "http://localhost:3000/dashboard/db/alien-dashboard?orgId=1&refresh=1s&from=now-5m&to=now"
fi