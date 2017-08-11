#!/bin/sh
max="$1"
START=$(date +%s);
modpass=grfg
pass=test

echo "Starting..."

export LOOP_COUNT=$max
echo $LOOP_COUNT
./clients/tools/ldapsearch -h akashl-z240.fareast.corp.microsoft.com:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID1=$!

./clients/tools/ldapsearch -h akashl-z240.fareast.corp.microsoft.com:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID2=$!

./clients/tools/ldapsearch -h akashl-z240.fareast.corp.microsoft.com:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID3=$!

./clients/tools/ldapsearch -h akashl-z240.fareast.corp.microsoft.com:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID4=$!

wait $PID1
wait $PID2
wait $PID3
wait $PID4

echo "Done."
