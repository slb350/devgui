#!/bin/sh

APP_PATH=/home/deploy/apps/opsgui/

export PATH=/home/deploy/.rbenv/shims:$PATH
export PATH=/home/deploy/.rbenv/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/home/deploy/.rbenv/bin/rbenv:$PATH
export RBENV_ROOT=/home/deploy/.rbenv

cd ${APP_PATH}/

rbenv init -

echo "Starting Puma..."

puma -d
