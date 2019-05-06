#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

gunicorn -b 0.0.0.0:8000 wsgi:app
