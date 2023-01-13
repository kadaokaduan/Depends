FROM ubuntu

#COPY sources.list /etc/apt

RUN apt-get update && apt-get clean
RUN apt-get install -q -y \
      curl \
      mariadb-server \
      vim \
      && apt-get clean 

ADD jdk-8u201-linux-x64.tar.gz /usr/local
ADD apache-tomcat-8.5.38.tar.gz /usr/local

RUN rm -rf /usr/local/apache-tomcat-8.5.38/webapps/*

ADD taintwebapp.war /usr/local/apache-tomcat-8.5.38/webapps

ENV JAVA_HOME /usr/local/jdk1.8.0_201
ENV PATH $JAVA_HOME/bin:$PATH

ADD *.sql /usr/local/sql/

ADD *.sh /usr/local/

RUN chmod 777 /usr/local/start.sh

ADD *.ldif /

ADD dubbo/ /usr/local/dubbo/

ADD TaintPost.jar /usr/local/

EXPOSE 8080
EXPOSE 8081

ENTRYPOINT ["/usr/local/start.sh"]

