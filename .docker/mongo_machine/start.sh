#!/usr/bin/env bash

if [[ -e /.runonce ]]; then
    echo "Kicking off entrypoint.sh script"
    /mongo_machine/entrypoint.sh

   echo "Kicking off primer.sh script"
    /mongo_machine/primer.sh
fi

# Start MongoDB
echo "Starting MongoDB server Mongod"
/usr/bin/mongod --auth $@
