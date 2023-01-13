雳鉴插桩对外全漏洞靶场

mysql默认使用127.0.0.1:3306, 具体可修改配置文件
ldap默认使用127.0.0.1:389, 具体可修改配置文件

docker打包步骤(可执行dockerBuild.sh)
1.在项目根目录下执行mvn clean package
2.cp tartget/taintwebapp.war docker/
3.在docker目录下执行 docker build -t iast_taintwebapp:v1.0 .
4.docker run -d -p 8080:8080 -p 8081:8081 -e IAST_URL=http://${IAST_SERVER_IP}:81 iast_taintwebapp:v1.0
