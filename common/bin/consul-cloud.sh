#!/bin/bash

set -e -o pipefail

docker rm -f consul-iad 2>&1 >/dev/null || true
dc1=$(docker run -d --name=consul-iad voxxit/consul agent -server -bootstrap-expect 1 -client 0.0.0.0 -data-dir /data -dc=iad)
ip1=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' $dc1)
echo "first dc container is consul-iad [$ip1]"

docker rm -f consul-ord 2>&1 >/dev/null || true
dc2=$(docker run -d --name=consul-ord voxxit/consul agent -server -bootstrap-expect 1 -client 0.0.0.0 -data-dir /data -dc=ord)
ip2=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' $dc2)
echo "second dc container is consul-ord [$ip2]"

docker exec -it $dc1 consul join -wan $ip2

exec curl -sL "http://$ip1:8500/v1/catalog/datacenters" | jq .
