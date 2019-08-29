#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME=${IMAGE_NAME:-spark-custom-addons}

if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
    ORIGINAL_IMAGE="${DOCKER_USERNAME}/${IMAGE_NAME}:${SPARK_VERSION}_hadoop-${HADOOP_VERSION}"

    IMAGE_NAME="test-${IMAGE_NAME}"
    TEST_IMAGE="${DOCKER_USERNAME}/${IMAGE_NAME}:${SPARK_VERSION}_hadoop-${HADOOP_VERSION}"
    docker tag "${ORIGINAL_IMAGE}" "${TEST_IMAGE}"
fi

docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker push "${DOCKER_USERNAME}/${IMAGE_NAME}:${SPARK_VERSION}_hadoop-${HADOOP_VERSION}"
