FROM tomcat:9-jre8-alpine

CMD ["catalina.sh", "run"]

EXPOSE 8080
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY $CI_PROJECT_DIR/target/java-web-project*.war /tmp/java-web-project.war
RUN mkdir -p /usr/local/tomcat/webapps/java-web-project && unzip /tmp/java-web-project.war -d /usr/local/tomcat/webapps/java-web-project
