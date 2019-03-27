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

## Generation of `.travis.yml`

This requires `python3` and `pip`. This will allow the installation of
`jinj2-cli`.

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
