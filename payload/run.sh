#!/bin/bash

echo "Hello, to the development ..."

DIR="/app"

# changing username on
usermod -u $USER_ID nodejs

# link modules
if [ ! -d "${DIR}/node_modules" ]; then
  ln -s /tmp/node_modules /app
fi

# typings
if [ ! -d "${DIR}/typings" ]; then
  typings install
fi

echo "Setting up environment ..."
grunt init

echo "Running environment ..."
grunt fun
