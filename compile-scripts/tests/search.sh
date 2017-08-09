#!/bin/sh
max="$1"
START=$(date +%s);
modpass=grfg
pass=test

echo "Starting..."

export LOOP_COUNT=$max
echo $LOOP_COUNT
./clients/tools/ldapsearch -h akashl-z240.fareast.corp.microsoft.com -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b 'dc=example,dc=com' '(objectclass=*)' > /dev/null
#./clients/tools/ldapsearch -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $pass \
#    -b 'dc=example,dc=com' '(objectclass=*)' > /dev/null

echo "Done."
