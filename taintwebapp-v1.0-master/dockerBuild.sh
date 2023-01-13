#!/bin/sh

mvn clean package && cp target/taintwebapp.war docker/

cd docker && docker build -t iast_taintwebapp:v1.0 .