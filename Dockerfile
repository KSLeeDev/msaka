###
FROM centos:7

RUN yum -y install java-1.8.0-openjdk wget
RUN wget http://dlcdn.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz
RUN tar -zxvf apache-tomcat-8.5.87.tar.gz
RUN rm -rf apache-tomcat-8.5.87.tar.gz
WORKDIR /apache-tomcat-8.5.87/webapps/ROOT
COPY ./msaka .
WORKDIR /apache-tomcat-8.5.87/lib
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.23/mysql-connector-java-8.0.23.jar
WORKDIR /apache-tomcat-8.5.87/bin
RUN chmod -R 777 .
EXPOSE 8080
ENTRYPOINT ["./catalina.sh", "run"]
###