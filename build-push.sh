#!/bin/bash
echo "Switching off Astro telemetry ..."
npx astro telemetry disable
echo "Building blog container ..."
docker build --no-cache -t registry.mocalabs.dev/mocalabs/blog:latest .
echo "Pushing container to registry ..."
docker push registry.mocalabs.dev/mocalabs/blog:latest
echo "Done building and pushing blog container to registry"