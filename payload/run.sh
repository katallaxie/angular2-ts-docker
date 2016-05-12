#!/bin/bash

echo "Hello, to the development ..."

# changing username on
usermod -u $USER_ID nodejs

# link modules
if [ ! -d "/app/node_modules" ]; then
  ln -s /tmp/node_modules /app
fi

# run the grunt
typings install
grunt init
grunt fun
