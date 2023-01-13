#!/bin/sh

/container/tool/run &;
ldapadd -x -D 'cn=admin,dc=example,dc=org' -f /maxcrc.ldif -w admin;
