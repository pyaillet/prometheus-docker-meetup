#!/bin/sh

plugin_list="raintank-kubernetes-app"

echo "Preparing data import"
until $(curl --silent --fail --show-error --output /dev/null http://$GRAFANA_HOST/api/datasources); do
    printf '.' ; sleep 1 ;
done ;

for i in $plugin_list; do
    echo "enabling plugin $plugin" &&
    curl --silent --fail --show-error \
        --request POST http://$GRAFANA_HOST/api/plugins/$plugin/settings
        --header "Content-Type: application/json" \
        --data-binary "{\"enabled\":true,\"pinned\":true,\"jsonData\":null}" ;
    echo "" ;
done ;

for file in /opt/grafana-datasource/*-datasource.json ; do
    if [ -e "$file" ] ; then
    echo "importing $file" &&
    curl --silent --fail --show-error \
        --request POST http://$GRAFANA_HOST/api/datasources \
        --header "Content-Type: application/json" \
        --data-binary "@$file" ;
    echo "" ;
    fi
done ;
for file in /opt/grafana-dashboards/*-dashboard.json ; do
    if [ -e "$file" ] ; then
    # wrap exported Grafana dashboard into valid json
    echo "importing $file" &&
    (echo '{"dashboard":';cat "$file";echo ',"inputs":[{"name":"DS_PROMETHEUS","pluginId":"prometheus","type":"datasource","value":"prometheus"}]}') | curl --silent --fail --show-error \
        --request POST http://$GRAFANA_HOST/api/dashboards/import \
        --header "Content-Type: application/json" \
        --data-binary @-;
    echo "" ;
    fi
done ;
while true; do
    sleep 1m ;
done   