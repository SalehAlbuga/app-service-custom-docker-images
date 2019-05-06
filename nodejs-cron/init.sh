#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

cron

npm start
