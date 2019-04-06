# `spark-custom-addons`

[![Build Status](https://travis-ci.org/guangie88/spark-custom-addons.svg?branch=master)](https://travis-ci.org/guangie88/spark-custom-addons)

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

## Generation of `.travis.yml`

This requires `python3` and `pip`. This will allow the installation of
`jinja2-cli`.

Run the following:

```bash
python3 -m pip install --user jinja2-cli[yaml]
```

Once installed, to generate the new `.travis.yml` file, run:

```bash
jinja2 .travis.yml.tmpl vars.yml > .travis.yml
```

As such, it is generally only necessary to update `vars.yml` to generate for
new Spark builds.
