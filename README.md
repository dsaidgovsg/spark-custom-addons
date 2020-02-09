# `spark-custom-addons`

![CI Status](https://img.shields.io/github/workflow/status/guangie88/spark-custom-addons/CI/master?label=CI&logo=github&style=for-the-badge)

Experimental set-up to add dependencies onto `spark-custom` Docker images.
Builds for both Debian and Alpine.

This adds the following:

- AWS Hadoop SDK JAR
  - Appends `spark.hadoop.fs.s3a.impl org.apache.hadoop.fs.s3a.S3AFileSystem`
    into `spark-defaults.conf`
- Google Cloud Storage SDK JAR
- MariaDB JDBC Connector JAR

Additionally, all Alpine builds have `gcompat` and `libc6-compat` installed to
prevent `glibc` shared library related issues.

## AWS Java SDK Version Derivation

The version of AWS Java SDK is dependent on the Hadoop version. An example of
how to derive this version number for Hadoop 3.1.0 is here:

<https://github.com/apache/hadoop/blob/release-3.1.0-RC0/hadoop-project/pom.xml#L137>

## How to Apply Template for CI build

For Linux user, you can download Tera CLI v0.3 at
<https://github.com/guangie88/tera-cli/releases> and place it in `PATH`.

Otherwise, you will need `cargo`, which can be installed via
[rustup](https://rustup.rs/).

Once `cargo` is installed, simply run `cargo install tera-cli --version=^0.3.0`.
