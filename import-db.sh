#!/bin/bash
set -e

aws s3 cp $SOURCE_S3_URL - | \
  gunzip | \
  mysql --user=$TARGET_USERNAME \
        --password=$TARGET_PASSWORD \
        --host=$TARGET_HOST \
        --port=$TARGET_PORT \
        $TARGET_DATABASE
