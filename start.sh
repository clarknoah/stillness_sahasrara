#!/bin/bash
NODE_ENV=test
./wait-for.sh neo4j:7687 -- npm start
npm start
