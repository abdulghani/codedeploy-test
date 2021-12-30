#!/bin/bash

# NEED TO BE SUPPLIED WITH
# env:
#   DEPLOYMENT_BUCKET
#   DEPLOYMENT_SECRET_ID

IMAGE_NAME="abdulghani/codedeploy-test"
REPO_NAME="${GITHUB_REPOSITORY//\//-}"
ARCHIVE_NAME="$REPO_NAME$(date +%s)_$GITHUB_SHA.tar"
S3_ARCHIVE_PATH="s3://$DEPLOYMENT_BUCKET/$REPO_NAME/$ARCHIVE_NAME"


echo "BUILDING DOCKER IMAGE..."
docker build . -f ./dockerfile -t $IMAGE_NAME

echo "ARCHIVING DOCKER IMAGE..."
docker save -o ./$ARCHIVE_NAME $IMAGE_NAME

echo "UPLOADING ARCHIVE TO S3..."
aws s3 cp ./$ARCHIVE_NAME $S3_ARCHIVE_PATH

echo "UPDATING SECRETS MANAGER IMAGE..."
aws secretsmanager update-secret --secret-id $DEPLOYMENT_SECRET_ID --secret-string $S3_ARCHIVE_PATH

echo "DONE"