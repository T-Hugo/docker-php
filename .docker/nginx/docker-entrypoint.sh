#!/bin/sh
set -euxo pipefail

# Defines the configuration of nginx with the environment variables
sed -i s/{{SERVER_NAME}}/${SERVER_NAME}/g /etc/nginx/sites-available/docker.conf
sed -i s/{{DOCUMENT_ROOT}}/${DOCUMENT_ROOT}/g /etc/nginx/sites-available/docker.conf
ln -sf /etc/nginx/sites-available/docker.conf /etc/nginx/sites-enabled/docker.conf

# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#entrypoint
exec "$@"
