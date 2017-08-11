#!/bin/sh
max="$1"
START=$(date +%s);
modpass=grfg
pass=test

echo "Starting..."

export LOOP_COUNT=$max
echo $LOOP_COUNT
./ldapsearch.orig -h 10.86.188.211:340 -x \
    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
    -b "dc=example,dc=com" "(|(cn=bulkuser1)(cn=bulkuser12345))" &
PID1=$!

#./ldapsearch.orig -h 10.168.236.82:341 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID2=$!

#./ldapsearch.orig -h 10.168.236.82:342 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID3=$!

#./ldapsearch.orig -h 10.168.236.82:343 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID4=$!

#./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:344 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID5=$!

#./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:345 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID6=$!

#./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:346 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID7=$!

#./ldapsearch -h akashl-z240.fareast.corp.microsoft.com:347 -x \
#    -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
#    -b "dc=example,dc=com" "(objectclass=*)" > /dev/null &
#PID8=$!

wait $PID1
#wait $PID2
#wait $PID3
#wait $PID4
#wait $PID5
#wait $PID6
#wait $PID7
#wait $PID8

echo "Done."
