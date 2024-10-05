#!/bin/bash

echo '=========================================='
echo 'pm2 process stop...'
echo '=========================================='

NAMESPACE='fe-node'

pm2 stop $NAMESPACE

echo 'end'
