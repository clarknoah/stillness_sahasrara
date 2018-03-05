#!/bin/bash
NODE_ENV=test
./wait-for-it.sh neo4j:7687 --strict -- npm start
