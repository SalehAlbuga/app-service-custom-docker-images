#!/bin/bash
# set -e

echo "Starting SSH ..."
service ssh start

nginx -g 'daemon off;'