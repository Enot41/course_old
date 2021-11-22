FROM tomcat:alpine
ADD target/hello-1.0.war /usr/local/tomcat/webapps/
EXPOSE 8081
CMD ["/usr/local/tomcat/bin/catalina.sh","run"]