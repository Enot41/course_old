FROM maven:3.6.1-jdk-8-alpine
RUN apk update
RUN apk add git
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp -r /boxfuse-sample-java-war-hello/target/hello-1.0.war /tmp/ROOT.war