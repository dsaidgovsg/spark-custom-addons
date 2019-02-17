ARG CUSTOM_VERSION="spark-2.4.0_hadoop-3.1.0_with-hive"
FROM guangie88/spark-custom:${CUSTOM_VERSION}

RUN set -eu && \
    apt-get update && apt-get install -y --no-install-recommends \
        curl \
        unzip \
        ; \
    cd ${SPARK_HOME}/jars; \
    curl -O http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.1.0/hadoop-aws-3.1.0.jar; \
    curl -O https://sdk-for-java.amazonwebservices.com/aws-java-sdk-1.11.271.zip; \
        unzip aws-java-sdk-1.11.271.zip; \
        mv ./aws-java-sdk-1.11.271/lib/aws-java-sdk-1.11.271.jar ${SPARK_HOME}/jars; \
        mv ./aws-java-sdk-1.11.271/third-party/lib/*.jar ${SPARK_HOME}/jars; \
        rm -r ./aws-java-sdk-1.11.271; \
        rm ./aws-java-sdk-1.11.271.zip; \
    curl -O https://downloads.mariadb.com/Connectors/java/connector-java-2.4.0/mariadb-java-client-2.4.0.jar; \
    :
