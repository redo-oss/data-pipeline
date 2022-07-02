#!/bin/bash

mongo <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "scrapy-jumia:27017",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "scrapy-secondary-1:27017",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "scrapy-secondary-2:27017",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF