FROM centos:latest
MAINTAINER xc
RUN yum install -y java unzip
ENV LC_ALL en_US.UTF-8
ADD apache-tomcat-7.0.56.zip  /root/apache-tomcat-7.0.56.zip
RUN unzip /root/apache-tomcat-7.0.56.zip -d /root/
EXPOSE 85
RUN chmod u+x /root/apache-tomcat-7.0.56/bin/*
ADD target /root/apache-tomcat-7.0.56/webapps/
ENV CATALINA_HOME /root/apache-tomcat-7.0.56
CMD ${CATALINA_HOME}/bin/catalina.sh run
