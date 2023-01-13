#!/bin/sh

service mysql start;

mysql -e "create database iast" && mysql -D iast -e "source /usr/local/sql/iast.sql";
mysql -D mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING '*0467CD695F76C85CEA84928040A38DA11B05F6EE';flush privileges;"

chmod 755 /usr/local/ldap.sh;

`nohup /container/tool/run > ldap.log 2>&1 &`;

sleep 5;

ldapadd -x -D 'cn=admin,dc=example,dc=org' -f /maxcrc.ldif -w admin;

if [ "$IAST_URL"x != ""x ] ;
then
 mkdir /usr/local/iast;
 if [ ! -f "/usr/local/iast/iast_agent.jar" ]; then
    curl $IAST_URL/api/agent/api/iast/download?version=MCswKzA= -o /usr/local/iast/iast_agent.jar;
 fi

 export JAVA_OPTS="-javaagent:/usr/local/iast/iast_agent.jar -Diast.background.download.timeout=30000 -Diast.socket.timeout=30000 -Dmoresec.iast.agent.tag=$TAG_NAME -Dmoresec.enable.gdpr=true -Dmoresec.enable.csrf=true -Dmoresec.enable.json_xss=true -Dmoresec.gdpr.random.seed=1
 $JAVA_OPTS";
fi

echo "start dubbo ... "
`
  export MY_JAVA_OPTS="$MY_JAVA_OPTS -javaagent:/usr/local/iast/iast_agent.jar  -Diast.socket.timeout=30000 -Dsun.zip.disableMemoryMapping=true -Dmoresec.iast.agent.tag=$TAG_NAME"
  nohup java -Dmoresec.agentdir=~/.moresec_iast_agent/provider2  $MY_JAVA_OPTS -jar /usr/local/dubbo/provider2.jar > provider2.log 2>&1 &
  sleep 15
  nohup java -Dmoresec.agentdir=~/.moresec_iast_agent/provider $MY_JAVA_OPTS -jar /usr/local/dubbo/provider.jar > provider.log 2>&1 &
  sleep 15
  nohup java -Dmoresec.agentdir=~/.moresec_iast_agent/consumer $MY_JAVA_OPTS -Dserver.port=8081 -jar /usr/local/dubbo/consumer.jar > consumer.log 2>&1 &
`

/usr/local/apache-tomcat-8.5.38/bin/catalina.sh run;



