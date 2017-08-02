#!/bin/sh
max="$1"
START=$(date +%s);
modpass=grfg
pass=test

get () {
    ldapsearch -h AKASHL-SP4.fareast.corp.microsoft.com -x \
        -D "cn=John Doe,ou=People,dc=example,dc=com" -w $modpass \
        -b 'dc=example,dc=com' '(objectclass=*)' > /dev/null
}

echo "Starting..."

for i in `seq 1 $max`
do
    get &
done

echo "Done."
