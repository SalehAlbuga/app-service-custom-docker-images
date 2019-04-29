#!/bin/bash
set -e

echo "Starting SSH ..."
service ssh start

rails s -e production