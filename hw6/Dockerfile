FROM tomcat:alpine
RUN apk update
ENV USER_HOME_DIR="/root"
RUN apk add git
RUN apk add maven
RUN apk add openjdk8
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN mvn package -f boxfuse-sample-java-war-hello/pom.xml
RUN mv /usr/local/tomcat/boxfuse-sample-java-war-hello/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]
