#Instalattion of Java and Maven

FROM maven:3.5-jdk-8-alpine

#Instalattion of Git:

RUN apk add git 
RUN git clone https://github.com/RavitejaAdepudi/vamsi.git

#Installation of Tomcat:


RUN apk  update 
RUN apk add wget 
WORKDIR /opt
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.3/bin/apache-tomcat-8.5.3.tar.gz
RUN tar -xvf apache-tomcat-8.5.3.tar.gz
EXPOSE 8080
CMD ["/opt/apache-tomcat-8.5.3/bin/catalina.sh","run"]

#Build the project
WORKDIR /vamsi/mavewebappdemo
RUN mvn clean install
RUN cp -R /vamsi/mavewebappdemo/target/* /opt/apache-tomcat-8.5.3/webapps
