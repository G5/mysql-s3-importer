#!/bin/bash
set -e

# sed comes from and is explained here:
# http://stackoverflow.com/questions/9446783/remove-definer-clause-from-mysql-dumps

aws s3 cp $SOURCE_S3_URL - | \
  gunzip | \
  pv | \
  sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' | \
  mysql --user=$TARGET_USERNAME \
        --password=$TARGET_PASSWORD \
        --host=$TARGET_HOST \
        --port=$TARGET_PORT \
        $TARGET_DATABASE
