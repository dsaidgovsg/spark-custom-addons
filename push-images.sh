#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME=${IMAGE_NAME:-spark-custom-addons}

HIVE_TAG_SUFFIX="$(if [ "${WITH_HIVE}" = "true" ]; then echo _hive; fi)"
PYSPARK_TAG_SUFFIX="$(if [ "${WITH_PYSPARK}" = "true" ]; then echo _pyspark; fi)"
TAG_NAME="${SPARK_VERSION}_hadoop-${HADOOP_VERSION}_python-${PYTHON_VERSION}${HIVE_TAG_SUFFIX}${PYSPARK_TAG_SUFFIX}_${DIST}"

docker login -u="${DOCKER_USERNAME}" -p="${DOCKER_PASSWORD}"
docker push "${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG_NAME}"
