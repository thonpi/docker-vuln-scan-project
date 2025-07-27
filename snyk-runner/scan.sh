#!/bin/sh

# Make sure snyk token is set as env variable SNYK_TOKEN
if [ -z "$SNYK_TOKEN" ]; then
  echo "Error: SNYK_TOKEN environment variable not set."
  exit 1
fi

IMAGE_NAME="my-insecure-app"
OUTPUT_FILE="/results/snyk.json"

echo "Running snyk container test for image $IMAGE_NAME"

snyk container test "$IMAGE_NAME" --json-file-output="$OUTPUT_FILE"

echo "Snyk scan complete, results saved to $OUTPUT_FILE"
