#!/bin/sh
max="$1"
START=$(date +%s);
modpass=grfg
pass=test

echo "Starting..."

export LOOP_COUNT=$max
echo $LOOP_COUNT
./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID1=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:341 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID2=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:342 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID3=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:343 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID4=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:344 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID5=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:345 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID6=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:346 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID7=$!

./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:347 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
PID8=$!

wait $PID1
wait $PID2
wait $PID3
wait $PID4
wait $PID5
wait $PID6
wait $PID7
wait $PID8

echo "Done."
