#!/bin/bash

echo "Hello, to the development ..."

# changing username on
usermod -u $USER_ID nodejs

# link modules
ln -s /tmp/node_modules /app

# run the grunt
typings install
grunt init
grunt fun
