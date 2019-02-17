ARG CUSTOM_VERSION="spark-2.4.0_hadoop-3.1.0_with-hive"
FROM guangie88/spark-custom:${CUSTOM_VERSION}

RUN set -eu && \
    # apt requirements
    apt-get update && apt-get install -y --no-install-recommends \
        curl \
        unzip \
        ; \
    # AWS S3 JAR
    cd ${SPARK_HOME}/jars; \
    curl -LO http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.1.0/hadoop-aws-3.1.0.jar; \
    curl -LO https://sdk-for-java.amazonwebservices.com/aws-java-sdk-1.11.271.zip; \
        unzip aws-java-sdk-1.11.271.zip; \
        mv ./aws-java-sdk-1.11.271/lib/aws-java-sdk-1.11.271.jar ${SPARK_HOME}/jars; \
        mv ./aws-java-sdk-1.11.271/third-party/lib/*.jar ${SPARK_HOME}/jars; \
        rm -r ./aws-java-sdk-1.11.271; \
        rm ./aws-java-sdk-1.11.271.zip; \
    echo "spark.hadoop.fs.s3a.impl    org.apache.hadoop.fs.s3a.S3AFileSystem" >> ${SPARK_HOME}/conf/spark-defaults.conf; \
    # Google Storage JAR
    curl -LO ${SPARK_HOME}/jars/gcs-connector-hadoop2-latest.jar \
        https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-hadoop2-latest.jar; \
    # MariaDB connector JAR
    curl -LO https://downloads.mariadb.com/Connectors/java/connector-java-2.4.0/mariadb-java-client-2.4.0.jar; \
    # apt clean-up
    apt-get remove -y \
        curl \
        unzip \
        ; \
    rm -rf /var/lib/apt/lists/*; \
    :
