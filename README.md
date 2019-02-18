# `spark-custom-addons`

[![CircleCI](https://circleci.com/gh/guangie88/spark-custom-addons.svg?style=svg)](https://circleci.com/gh/guangie88/spark-custom-addons)

Experimental set-up to add dependencies onto `spark-custom` Docker images.
Builds for both Debian and Alpine.

This adds the following:

- AWS Hadoop SDK JAR
  - Appends `spark.hadoop.fs.s3a.impl org.apache.hadoop.fs.s3a.S3AFileSystem`
    into `spark-defaults.conf`
- Google Cloud Storage SDK JAR
- MariaDB JDBC Connector JAR
