# Start from the official Python base image.
FROM apachepulsar/pulsar:latest

COPY cdc.yaml .

# RUN apt-get update && apt-get install -y wget
# RUN wget http://archive.apache.org/dist/pulsar/pulsar-2.3.0/connectors/pulsar-io-kafka-connect-adaptor-2.3.0.nar \
# && tar zxvpf pulsar-io-kafka-connect-adaptor-2.3.0.nar && rm pulsar-io-kafka-connect-adaptor-2.3.0.nar

RUN mkdir -p connectors
COPY pulsar-to-mysql connectors

CMD [ "bin/pulsar","standalone"]

