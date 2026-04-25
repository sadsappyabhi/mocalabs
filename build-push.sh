#!/bin/bash
echo "Building blog container ..."
docker build --no-cache -t mocalabs/blog:latest .
echo "Pushing container to registry ..."
docker push mocalabs/blog:latest
echo "Done building and pushing blog container to registry"