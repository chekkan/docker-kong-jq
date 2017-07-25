#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

export KONG_CASSANDRA_CONTACT_POINTS="$(curl -s http://$CONSUL_HTTP:8500/v1/catalog/service/kong-db | jq -r '[.[].Address] | join(",")')"

exec "$@"