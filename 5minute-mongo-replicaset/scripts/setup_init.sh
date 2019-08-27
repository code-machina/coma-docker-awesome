#!/usr/bin/env bash

echo "Waiting for MongoDB startup.."
until [ "$(mongo --host anguis1:27017 admin --eval "printjson(db.serverStatus())" | grep uptime | head -1)" ]; do
  printf '.'
  sleep 1
done

echo $(mongo --host anguis1:27017 admin --eval "printjson(db.serverStatus())" | grep uptime | head -1)
echo "MongoDB Started.."


echo SETUP.sh time now: `date +"%T" `
mongo --host anguis1:27017 <<EOF
   var cfg = {
        "_id": "anguis-repl",
        "members": [
            {
                "_id": 0,
                "host": "anguis1:27017",
                "priority": 2
            },
            {
                "_id": 1,
                "host": "anguis2:27017",
                "priority": 0
            },
            {
                "_id": 2,
                "host": "anguis3:27017",
                "priority": 1,
                "arbiterOnly": true
            }
        ]
    };
    rs.initiate(cfg, { force: true });
    rs.reconfig(cfg, { force: true });
EOF