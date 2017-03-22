FROM anapsix/alpine-java:latest

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl

WORKDIR /tools

RUN wget http://github.com/rabbitmq/rabbitmq-perf-test/releases/download/v1.2.0/rabbitmq-perf-test-1.2.0-bin.tar.gz

RUN tar -xzf rabbitmq-perf-test-1.2.0-bin.tar.gz && rm rabbitmq-perf-test-1.2.0-bin.tar.gz

RUN chmod +x ./rabbitmq-perf-test-1.2.0/bin/runjava

ENV PATH /tools/rabbitmq-perf-test-1.2.0/bin:$PATH

ADD run-test.sh .

RUN chmod +x ./run-test.sh

CMD ["sh", "-c", "tail -f /dev/null"]