ARG FROM_DOCKER_IMAGE="guangie88/spark-custom"
ARG BASE_VERSION=
ARG SPARK_VERSION=
ARG SCALA_VERSION=
ARG HADOOP_VERSION=
ARG PYTHON_VERSION=
ARG HIVE_TAG_SUFFIX=
ARG PYSPARK_TAG_SUFFIX=

FROM ${FROM_DOCKER_IMAGE}:${BASE_VERSION}_${SPARK_VERSION}_scala-${SCALA_VERSION}_hadoop-${HADOOP_VERSION}_python-${PYTHON_VERSION}${HIVE_TAG_SUFFIX}${PYSPARK_TAG_SUFFIX}_debian

ARG HADOOP_VERSION=

RUN set -euo pipefail && \
    # apt requirements
    apt-get update && apt-get install -y --no-install-recommends \
        curl \
        unzip \
        ; \
    # AWS S3 JAR
    pushd ${SPARK_HOME}/jars; \
    ## Get the aws-java-sdk version dynamic based on Hadoop version
    ## Do not use head -n1 because it will trigger 141 exit code due to early return on pipe
    AWS_JAVA_SDK_VERSION="$(curl -s https://raw.githubusercontent.com/apache/hadoop/branch-${HADOOP_VERSION}/hadoop-project/pom.xml | grep -A1 aws-java-sdk | grep -oE "[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+" | tr "\r\n" " " | cut -d " " -f 1)"; \
    ## Download the JAR
    curl -LO https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar; \
    curl -LO https://sdk-for-java.amazonwebservices.com/aws-java-sdk-${AWS_JAVA_SDK_VERSION}.zip; \
    unzip aws-java-sdk-${AWS_JAVA_SDK_VERSION}.zip; \
    find aws-java-sdk-${AWS_JAVA_SDK_VERSION} -name "*.jar" -exec mv {} ${SPARK_HOME}/jars/ \; ; \
    rm -r ./aws-java-sdk-${AWS_JAVA_SDK_VERSION}; \
    rm ./aws-java-sdk-${AWS_JAVA_SDK_VERSION}.zip; \
    echo "spark.hadoop.fs.s3a.impl    org.apache.hadoop.fs.s3a.S3AFileSystem" >> ${SPARK_HOME}/conf/spark-defaults.conf; \
    # Google Storage JAR
    curl -LO https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop2-latest.jar; \
    # MariaDB connector JAR
    curl -LO https://downloads.mariadb.com/Connectors/java/connector-java-2.4.0/mariadb-java-client-2.4.0.jar; \
    popd; \
    # apt clean-up
    apt-get remove -y \
        curl \
        unzip \
        ; \
    rm -rf /var/lib/apt/lists/*; \
    :
