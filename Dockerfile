FROM mysql:5.5

ENV AWS_ACCESS_KEY_ID="" \
    AWS_SECRET_ACCESS_KEY="" \
    AWS_S3_REGION="" \
    SOURCE_S3_URL="" \
    TARGET_HOST="" \
    TARGET_DATABASE="" \
    TARGET_USERNAME="" \
    TARGET_PASSWORD="" \
    TARGET_PORT=""

RUN apt-get update && \
    apt-get install -y curl unzip python pv && \
    apt-get clean && \
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o awscli-bundle.zip && \
    unzip awscli-bundle.zip && \
    ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

COPY import-db.sh /

CMD ./import-db.sh
