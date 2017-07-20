echo "Making all in `pwd`"
for i in include libraries clients servers tests doc ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bn all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory include
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/include'
rm -f ldap_config.h
echo "Making ldap_config.h"
echo "/* Generated from ./ldap_config.hin on `date` */" > ldap_config.h;  \
if test NT = NT; then \
    sysconfdir=`cygpath -w /mingw64/etc/openldap | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    datadir=`cygpath -w /mingw64/share/openldap | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    bindir=`cygpath -w /mingw64/bin | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    sbindir=`cygpath -w /mingw64/sbin | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    libexecdir=`cygpath -w /mingw64/libexec | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    moduledir=`cygpath -w /mingw64/libexec/openldap | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    localstatedir=`cygpath -w /mingw64/var | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
else \
    sysconfdir=/mingw64/etc/openldap; \
    datadir=/mingw64/share/openldap; \
    bindir=/mingw64/bin; \
    sbindir=/mingw64/sbin; \
    libexecdir=/mingw64/libexec; \
    moduledir=/mingw64/libexec/openldap; \
    localstatedir=/mingw64/var; \
    localedir=; \
fi; \
sed \
		-e "s;%SYSCONFDIR%;$sysconfdir;" \
		-e "s;%DATADIR%;$datadir;" \
		-e "s;%BINDIR%;$bindir;" \
		-e "s;%SBINDIR%;$sbindir;" \
		-e "s;%LIBEXECDIR%;$libexecdir;" \
		-e "s;%MODULEDIR%;$moduledir;" \
		-e "s;%RUNDIR%;$localstatedir;" \
		-e "s;%LOCALEDIR%;$localedir;" \
		 ./ldap_config.hin >> ldap_config.h; \
chmod 444 ldap_config.h
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/include'
 
  Entering subdirectory libraries
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/libraries'
echo "Making all in `pwd`"
for i in liblutil liblber liblunicode libldap libldap_r librewrite ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory liblutil
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/liblutil'
rm -f version.c
../../build/mkversion -v "2.4.45" liblutil.a > version.c
clang -m64 -I../../include        -I../../include       -c -o base64.o base64.c
clang -m64 -I../../include        -I../../include       -c -o entropy.o entropy.c
clang -m64 -I../../include        -I../../include       -c -o sasl.o sasl.c
clang -m64 -I../../include        -I../../include       -c -o signal.o signal.c
clang -m64 -I../../include        -I../../include       -c -o hash.o hash.c
clang -m64 -I../../include        -I../../include       -c -o passfile.o passfile.c
clang -m64 -I../../include        -I../../include       -c -o md5.o md5.c
clang -m64 -I../../include        -I../../include       -c -o passwd.o passwd.c
clang -m64 -I../../include        -I../../include       -c -o sha1.o sha1.c
clang -m64 -I../../include        -I../../include       -c -o getpass.o getpass.c
clang -m64 -I../../include        -I../../include       -c -o lockf.o lockf.c
clang -m64 -I../../include        -I../../include       -c -o utils.o utils.c
clang -m64 -I../../include        -I../../include       -c -o uuid.o uuid.c
clang -m64 -I../../include        -I../../include       -c -o sockpair.o sockpair.c
clang -m64 -I../../include        -I../../include       -c -o avl.o avl.c
clang -m64 -I../../include        -I../../include       -c -o tavl.o tavl.c
clang -m64 -I../../include        -I../../include       -c -o meter.o meter.c
clang -m64 -I../../include        -I../../include       -c -o setproctitle.o setproctitle.c
clang -m64 -I../../include        -I../../include       -c -o getpeereid.o getpeereid.c
clang -m64 -I../../include        -I../../include       -c -o ntservice.o ntservice.c
if [ ! -f slapdmsg.bin ]; then cp ./slapdmsg.bin .; fi
windres slapdmsg.rc -O coff -o slapdmsg.res
clang -m64 -I../../include        -I../../include       -c -o version.o version.c
ar ru liblutil.a base64.o entropy.o sasl.o signal.o hash.o passfile.o md5.o passwd.o sha1.o getpass.o lockf.o utils.o uuid.o sockpair.o avl.o tavl.o meter.o setproctitle.o getpeereid.o ntservice.o slapdmsg.res version.o
ranlib liblutil.a
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/liblutil'
 
  Entering subdirectory liblber
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/liblber'
rm -f version.c
../../build/mkversion -v "2.4.45" liblber.la > version.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c assert.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c decode.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c encode.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c io.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c bprint.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c debug.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c memory.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c options.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c sockbuf.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c nt_err.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include -I../../include     -DLBER_LIBRARY -c version.c
/bin/sh ../../libtool  --mode=link clang -m64    -no-undefined -avoid-version -rpath /mingw64/lib -o liblber.la assert.lo decode.lo encode.lo io.lo bprint.lo debug.lo memory.lo options.lo sockbuf.lo nt_err.lo version.lo  -lregex  -lws2_32
clang -m64 -I../../include -I../../include       -c -o dtest.o dtest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o dtest dtest.o liblber.la ../../libraries/liblutil/liblutil.a  -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o etest.o etest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o etest etest.o liblber.la ../../libraries/liblutil/liblutil.a  -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o idtest.o idtest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a  -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/liblber'
 
  Entering subdirectory liblunicode
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/liblunicode'
rm -f version.c
../../build/mkversion -v "2.4.45" liblunicode.a > version.c
for i in ucdata.c ucgendat.c ure.c urestubs.c ucdata.h ure.h uctable.h; do \
	rm -f $i ; \
	ii=`find . -name $i` ; \
	../../build/shtool mkln -s $ii . ; \
done
touch .links
make ucgendat
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/liblunicode'
for i in ucdata.c ucgendat.c ure.c urestubs.c ucdata.h ure.h uctable.h; do \
	rm -f $i ; \
	ii=`find . -name $i` ; \
	../../build/shtool mkln -s $ii . ; \
done
touch .links
clang -m64 -I../../include        -I../../include       -c -o ucgendat.o ucgendat.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ucgendat ucgendat.o ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la  -lregex  -lws2_32 
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/liblunicode'
./ucgendat ./UnicodeData.txt -x ./CompositionExclusions.txt
clang -m64 -I../../include        -I../../include       -c -o ucdata.o ucdata.c
clang -m64 -I../../include        -I../../include       -c -o ure.o ure.c
clang -m64 -I../../include        -I../../include       -c -o urestubs.o urestubs.c
clang -m64 -I../../include        -I../../include       -c -o ucstr.o ucstr.c
clang -m64 -I../../include        -I../../include       -c -o version.o version.c
ar ru liblunicode.a ucdata.o ure.o urestubs.o ucstr.o version.o
ranlib liblunicode.a
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/liblunicode'
 
  Entering subdirectory libldap
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/libldap'
rm -f version.c
../../build/mkversion -v "2.4.45" libldap.la > version.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c bind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c open.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c result.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c error.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c compare.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c search.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c controls.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c messages.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c references.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c extended.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c cyrus.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c modify.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c add.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c modrdn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c delete.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c abandon.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c sasl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c gssapi.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c sbind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c unbind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c cancel.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c filter.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c free.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c sort.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c passwd.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c whoami.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c getdn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c getentry.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c getattr.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c getvalues.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c addentry.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c request.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c os-ip.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c url.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c pagectrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c sortctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c vlvctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c init.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c options.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c print.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c string.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c util-int.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c schema.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c charray.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c os-local.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c dnssrv.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c utf-8.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c utf-8-conv.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c tls2.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c tls_o.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c tls_g.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c tls_m.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c turn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c ppolicy.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c dds.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c txn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c ldap_sync.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c stctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c assertion.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c deref.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c ldif.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c fetch.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include     -DLDAP_LIBRARY -c version.c
/bin/sh ../../libtool  --mode=link clang -m64    -no-undefined -avoid-version -rpath /mingw64/lib -o libldap.la bind.lo open.lo result.lo error.lo compare.lo search.lo controls.lo messages.lo references.lo extended.lo cyrus.lo modify.lo add.lo modrdn.lo delete.lo abandon.lo sasl.lo gssapi.lo sbind.lo unbind.lo cancel.lo filter.lo free.lo sort.lo passwd.lo whoami.lo getdn.lo getentry.lo getattr.lo getvalues.lo addentry.lo request.lo os-ip.lo url.lo pagectrl.lo sortctrl.lo vlvctrl.lo init.lo options.lo print.lo string.lo util-int.lo schema.lo charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo tls2.lo tls_o.lo tls_g.lo tls_m.lo turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo assertion.lo deref.lo ldif.lo fetch.lo version.lo  ../../libraries/liblber/liblber.la -lregex  -lws2_32    
clang -m64 -I../../include        -I../../include       -c -o apitest.o apitest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o apitest apitest.o libldap.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
clang -m64 -I../../include        -I../../include       -c -o dntest.o dntest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o dntest dntest.o libldap.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
clang -m64 -I../../include        -I../../include       -c -o ftest.o ftest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ftest ftest.o libldap.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
clang -m64 -I../../include        -I../../include       -c -o test.o test.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ltest test.o libldap.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
clang -m64 -I../../include        -I../../include       -c -o urltest.o urltest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o urltest urltest.o libldap.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/libldap'
 
  Entering subdirectory libldap_r
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/libldap_r'
rm -f version.c
../../build/mkversion -v "2.4.45" libldap_r.la > version.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c threads.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c rdwr.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c rmutex.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c tpool.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c rq.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_posix.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_cthreads.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_thr.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_nt.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_pth.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_stub.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c thr_debug.c
for i in apitest.c test.c bind.c open.c result.c error.c compare.c search.c controls.c messages.c references.c extended.c cyrus.c modify.c add.c modrdn.c delete.c abandon.c sasl.c gssapi.c sbind.c unbind.c cancel.c filter.c free.c sort.c passwd.c whoami.c getdn.c getentry.c getattr.c getvalues.c addentry.c request.c os-ip.c url.c pagectrl.c sortctrl.c vlvctrl.c init.c options.c print.c string.c util-int.c schema.c charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c tls2.c tls_o.c tls_g.c tls_m.c turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c assertion.c deref.c ldif.c fetch.c; do \
	rm -f $i ; \
	../../build/shtool mkln -s ./../libldap/$i . ; \
done
touch .links
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c bind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c open.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c result.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c error.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c compare.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c search.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c controls.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c messages.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c references.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c extended.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c cyrus.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c modify.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c add.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c modrdn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c delete.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c abandon.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c sasl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c gssapi.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c sbind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c unbind.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c cancel.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c filter.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c free.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c sort.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c passwd.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c whoami.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c getdn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c getentry.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c getattr.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c getvalues.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c addentry.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c request.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c os-ip.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c url.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c pagectrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c sortctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c vlvctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c init.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c options.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c print.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c string.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c util-int.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c schema.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c charray.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c os-local.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c dnssrv.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c utf-8.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c utf-8-conv.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c tls2.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c tls_o.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c tls_g.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c tls_m.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c turn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c ppolicy.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c dds.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c txn.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c ldap_sync.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c stctrl.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c assertion.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c deref.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c ldif.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c fetch.c
/bin/sh ../../libtool  --mode=compile clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap   -DLDAP_LIBRARY -c version.c
/bin/sh ../../libtool  --mode=link clang -m64    -no-undefined -avoid-version -rpath /mingw64/lib -o libldap_r.la threads.lo rdwr.lo rmutex.lo tpool.lo  rq.lo thr_posix.lo thr_cthreads.lo thr_thr.lo thr_nt.lo thr_pth.lo thr_stub.lo thr_debug.lo bind.lo open.lo result.lo error.lo compare.lo search.lo controls.lo messages.lo references.lo extended.lo cyrus.lo modify.lo add.lo modrdn.lo delete.lo abandon.lo sasl.lo gssapi.lo sbind.lo unbind.lo cancel.lo filter.lo free.lo sort.lo passwd.lo whoami.lo getdn.lo getentry.lo getattr.lo getvalues.lo addentry.lo request.lo os-ip.lo url.lo pagectrl.lo sortctrl.lo vlvctrl.lo init.lo options.lo print.lo string.lo util-int.lo schema.lo charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo tls2.lo tls_o.lo tls_g.lo tls_m.lo turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo assertion.lo deref.lo ldif.lo fetch.lo version.lo  ../../libraries/liblber/liblber.la -lregex  -lws2_32    
clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap     -c -o apitest.o apitest.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o apitest apitest.o libldap_r.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
clang -m64 -I../../include        -I../../include  -DLDAP_R_COMPILE -I./../libldap     -c -o test.o test.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ltest test.o libldap_r.la ../../libraries/liblber/liblber.la ../../libraries/liblutil/liblutil.a      -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/libldap_r'
 
  Entering subdirectory librewrite
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/libraries/librewrite'
rm -f version.c
../../build/mkversion -v "2.4.45" librewrite.a > version.c
clang -m64 -I../../include        -I../../include       -c -o config.o config.c
clang -m64 -I../../include        -I../../include       -c -o context.o context.c
clang -m64 -I../../include        -I../../include       -c -o info.o info.c
clang -m64 -I../../include        -I../../include       -c -o ldapmap.o ldapmap.c
clang -m64 -I../../include        -I../../include       -c -o map.o map.c
clang -m64 -I../../include        -I../../include       -c -o params.o params.c
clang -m64 -I../../include        -I../../include       -c -o rule.o rule.c
clang -m64 -I../../include        -I../../include       -c -o session.o session.c
clang -m64 -I../../include        -I../../include       -c -o subst.o subst.c
clang -m64 -I../../include        -I../../include       -c -o var.o var.c
clang -m64 -I../../include        -I../../include       -c -o xmap.o xmap.c
clang -m64 -I../../include        -I../../include       -c -o version.o version.c
ar ru librewrite.a config.o context.o info.o ldapmap.o map.o params.o rule.o session.o subst.o var.o xmap.o version.o
ranlib librewrite.a
clang -m64 -I../../include        -I../../include       -c -o rewrite.o rewrite.c
clang -m64 -I../../include        -I../../include       -c -o parse.o parse.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o rewrite rewrite.o parse.o librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries/librewrite'
 
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/libraries'
 
  Entering subdirectory clients
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/clients'
echo "Making all in `pwd`"
for i in tools ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory tools
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/clients/tools'
rm -f ldsversion.c
../../build/mkversion -v "2.4.45" -s ldapsearch > ldsversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapsearch.o ldapsearch.c
clang -m64 -I../../include        -I../../include       -c -o common.o common.c
clang -m64 -I../../include        -I../../include       -c -o ldsversion.o ldsversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapsearch ldapsearch.o common.o ldsversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldmversion.c
../../build/mkversion -v "2.4.45" -s ldapmodify > ldmversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapmodify.o ldapmodify.c
clang -m64 -I../../include        -I../../include       -c -o ldmversion.o ldmversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapmodify ldapmodify.o common.o ldmversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f lddversion.c
../../build/mkversion -v "2.4.45" -s ldapdelete > lddversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapdelete.o ldapdelete.c
clang -m64 -I../../include        -I../../include       -c -o lddversion.o lddversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapdelete ldapdelete.o common.o lddversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldrversion.c
../../build/mkversion -v "2.4.45" -s ldapmodrdn > ldrversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapmodrdn.o ldapmodrdn.c
clang -m64 -I../../include        -I../../include       -c -o ldrversion.o ldrversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapmodrdn ldapmodrdn.o common.o ldrversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldpversion.c
../../build/mkversion -v "2.4.45" -s ldappasswd > ldpversion.c
clang -m64 -I../../include        -I../../include       -c -o ldappasswd.o ldappasswd.c
clang -m64 -I../../include        -I../../include       -c -o ldpversion.o ldpversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldappasswd ldappasswd.o common.o ldpversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldwversion.c
../../build/mkversion -v "2.4.45" -s ldapwhoami > ldwversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapwhoami.o ldapwhoami.c
clang -m64 -I../../include        -I../../include       -c -o ldwversion.o ldwversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapwhoami ldapwhoami.o common.o ldwversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldcversion.c
../../build/mkversion -v "2.4.45" -s ldapcompare > ldcversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapcompare.o ldapcompare.c
clang -m64 -I../../include        -I../../include       -c -o ldcversion.o ldcversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapcompare ldapcompare.o common.o ldcversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f ldeversion.c
../../build/mkversion -v "2.4.45" -s ldapexop > ldeversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapexop.o ldapexop.c
clang -m64 -I../../include        -I../../include       -c -o ldeversion.o ldeversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapexop ldapexop.o common.o ldeversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
rm -f lduversion.c
../../build/mkversion -v "2.4.45" -s ldapurl > lduversion.c
clang -m64 -I../../include        -I../../include       -c -o ldapurl.o ldapurl.c
clang -m64 -I../../include        -I../../include       -c -o lduversion.o lduversion.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldapurl ldapurl.o lduversion.o ../../libraries/liblutil/liblutil.a ../../libraries/libldap/libldap.la ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/clients/tools'
 
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/clients'
 
  Entering subdirectory servers
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/servers'
echo "Making all in `pwd`"
for i in slapd ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory slapd
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd'
if test -n "back-ldif back-monitor back-mdb back-relay"; then \
    echo "building static backends..."; \
    for i in XX back-ldif back-monitor back-mdb back-relay; do \
    	if test $i != XX; then \
	    echo " "; echo "  cd $i; make -Bnw all"; \
	    ( cd $i; make -Bnw all ); \
	    if test $? != 0; then exit 1; fi; \
	fi; \
    done; \
    echo " "; \
fi
building static backends...
 
  cd back-ldif; make -Bnw all
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-ldif'
rm -f version.c
../../../build/mkversion -v "2.4.45" back_ldif > version.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..     -c ldif.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..     -c version.c
ar ruv libback_ldif.a `echo ldif.lo | sed 's/\.lo/.o/g'` version.o
ranlib libback_ldif.a
touch ../.backend
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-ldif'
 
  cd back-monitor; make -Bnw all
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-monitor'
rm -f version.c
../../../build/mkversion -v "2.4.45" back_monitor > version.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c init.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c search.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c compare.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c modify.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c bind.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c operational.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c cache.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c entry.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c backend.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c database.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c thread.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c conn.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c rww.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c log.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c operation.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c sent.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c listener.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c time.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c overlay.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include -I../../../include -I.. -I./.. -I./../slapi     -c version.c
ar ruv libback_monitor.a `echo init.lo search.lo compare.lo modify.lo bind.lo operational.lo cache.lo entry.lo backend.lo database.lo thread.lo conn.lo rww.lo log.lo operation.lo sent.lo listener.lo time.lo overlay.lo | sed 's/\.lo/.o/g'` version.o
ranlib libback_monitor.a
touch ../.backend
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-monitor'
 
  cd back-mdb; make -Bnw all
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-mdb'
rm -f version.c
../../../build/mkversion -v "2.4.45" back_mdb > version.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c init.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c tools.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c config.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c add.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c bind.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c compare.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c delete.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c modify.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c modrdn.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c search.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c extended.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c operational.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c attr.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c index.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c key.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c filterindex.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c dn2entry.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c dn2id.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c id2entry.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c idl.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c nextid.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c monitor.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c ./../../../libraries/liblmdb/mdb.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c ./../../../libraries/liblmdb/midl.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./.. -I./../../../libraries/liblmdb     -c version.c
ar ruv libback_mdb.a `echo init.lo tools.lo config.lo add.lo bind.lo compare.lo delete.lo modify.lo modrdn.lo search.lo extended.lo operational.lo attr.lo index.lo key.lo filterindex.lo dn2entry.lo dn2id.lo id2entry.lo idl.lo nextid.lo monitor.lo mdb.lo midl.lo | sed 's/\.lo/.o/g'` version.o
ranlib libback_mdb.a
touch ../.backend
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-mdb'
 
  cd back-relay; make -Bnw all
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-relay'
rm -f version.c
../../../build/mkversion -v "2.4.45" back_relay > version.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..     -c init.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..     -c op.c
/bin/sh ../../../libtool --tag=disable-shared --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..     -c version.c
ar ruv libback_relay.a `echo init.lo op.lo | sed 's/\.lo/.o/g'` version.o
ranlib libback_relay.a
touch ../.backend
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/back-relay'
 
rm -f -r tmp
../../build/shtool mkdir -p tmp
for i in back-*/*.a; do \
	( \
	  cd tmp; \
	  ar x ../$i; \
	  pre=`echo $i | sed -e 's/\/.*$//' -e 's/back-//'`; \
	  for j in *.o; do \
		mv $j ${pre}$j; \
	  done; \
	  ar ruv libbackends.a *.o 2>&1 | grep -v truncated; \
	  rm -f *.o __.SYMDEF  ________64ELEL_ ; \
	  echo "added backend library $i"; \
	  echo ""; \
	); \
done
mv -f tmp/libbackends.a ./libbackends.a
rm -f -r tmp
if test ! -z "ranlib" ; then \
	ranlib libbackends.a; \
fi
ls -l libbackends.a; echo ""
cd overlays; make -Bnw static
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/overlays'
clang -m64 -I../../../include        -I../../../include -I.. -I./..      -c -o statover.o statover.c
clang -m64 -I../../../include        -I../../../include -I.. -I./..      -c -o syncprov.o syncprov.c
clang -m64 -I../../../include        -I../../../include -I.. -I./..      -c -o overlays.o overlays.c
rm -f version.c
../../../build/mkversion -v "2.4.45" ../liboverlays.a > version.c
/bin/sh ../../../libtool --tag=disable-static --mode=compile clang -m64 -I../../../include        -I../../../include -I.. -I./..    -DSLAPD_IMPORT -c version.c
ar rs ../liboverlays.a statover.o syncprov.o overlays.o
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/overlays'
rm -f version.c
../../build/mkversion -v "2.4.45" -s -n Versionstr slapd > version.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o main.o main.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o globals.o globals.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o bconfig.o bconfig.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o config.o config.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o daemon.o daemon.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o connection.o connection.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o search.o search.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o filter.o filter.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o add.o add.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o cr.o cr.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o attr.o attr.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o entry.o entry.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o backend.o backend.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o backends.o backends.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o result.o result.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o operation.o operation.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o dn.o dn.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o compare.o compare.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o modify.o modify.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o delete.o delete.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o modrdn.o modrdn.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o ch_malloc.o ch_malloc.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o value.o value.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o ava.o ava.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o bind.o bind.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o unbind.o unbind.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o abandon.o abandon.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o filterentry.o filterentry.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o phonetic.o phonetic.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o acl.o acl.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o str2filter.o str2filter.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o aclparse.o aclparse.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o init.o init.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o user.o user.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o lock.o lock.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o controls.o controls.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o extended.o extended.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o passwd.o passwd.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o schema.o schema.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o schema_check.o schema_check.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o schema_init.o schema_init.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o schema_prep.o schema_prep.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o schemaparse.o schemaparse.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o ad.o ad.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o at.o at.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o mr.o mr.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o syntax.o syntax.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o oc.o oc.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o saslauthz.o saslauthz.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o oidm.o oidm.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o starttls.o starttls.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o index.o index.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o sets.o sets.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o referral.o referral.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o root_dse.o root_dse.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o sasl.o sasl.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o module.o module.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o mra.o mra.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o mods.o mods.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o sl_malloc.o sl_malloc.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o zn_malloc.o zn_malloc.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o limits.o limits.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o operational.o operational.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o matchedValues.o matchedValues.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o cancel.o cancel.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o syncrepl.o syncrepl.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o backglue.o backglue.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o backover.o backover.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o ctxcsn.o ctxcsn.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o ldapsync.o ldapsync.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o frontend.o frontend.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapadd.o slapadd.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapcat.o slapcat.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapcommon.o slapcommon.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapdn.o slapdn.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapindex.o slapindex.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slappasswd.o slappasswd.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slaptest.o slaptest.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapauth.o slapauth.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapacl.o slapacl.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o component.o component.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o aci.o aci.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o alock.o alock.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o txn.o txn.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o slapschema.o slapschema.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o nt_svc.o nt_svc.c
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o version.o version.c
for i in XX    ; do \
    path=`expr "$i" : "-L\(.*\)"`; \
    if test $? != 0; then continue; fi; \
    paths="$paths $path"; \
done; \
objs=""; \
for i in main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   ; do \
    obj="" ; \
    case $i in \
	-l*) \
	    done="" ;\
	    base=`expr "$i" : "-l\(.*\)"`; \
	    for p in . $paths ; do \
		for ext in la dll dll.a a ; do \
		    path=$p/lib$base.$ext; \
		    test ! -f $path && continue; \
		    if test $ext = la ; then \
			for t in dlname old_library ; do \
			    line=`grep "^$t=" $path`; \
			    lib=`expr "$line" : "[^']*'\(.*\)'"`; \
			    test -n "$lib" && test -f $p/$lib && \
				path=$p/$lib && break; \
			done; \
			test $t = dlname && ext=dll; \
			test $t = old_library && ext=a; \
		    fi; \
		    if test $ext = a ; then \
			obj=$path; \
		    fi; \
		    done=done; \
		    break; \
		done; \
		test -n "$done" && break; \
	    done; \
	    test -z "$obj" && continue; \
	    ;; \
	*.la) \
	    if test -n "-static"; then \
		    base=`expr "$i" : ".*/\(.*\).la"`; \
		    path=`expr "$i" : "\(.*/\).*"`; \
		    obj=$path.libs/$base.a; \
	    fi; \
	    ;; \
	*.dll.a) \
	    ;; \
	*.o | *.a) \
	    obj=$i; \
    esac; \
    objs="$objs $obj"; \
done; \
echo dlltool --exclude-symbols main,ServiceMain@8 --export-all-symbols \
		--output-def slapd.def.tmp $objs; \
dlltool --exclude-symbols main,ServiceMain@8 --export-all-symbols \
		--output-def slapd.def.tmp $objs;
echo EXPORTS > slapd.def
sed -e 1,2d -e 's/ @ [0-9][0-9]*//' slapd.def.tmp | sort >> slapd.def
rm -f slapd.def.tmp
rm -f symdummy.c
echo "generating symdummy.c..."; \
echo "static void never_called() {" > symdummy.c.tmp; \
cat slapd.def | while read line; \
do \
    set dummy $line; \
    case $# in \
	3) \
	    echo "int $2();" >> symdummy.c; \
	    echo "$2();" >> symdummy.c.tmp; \
	    ;; \
	4) \
	    echo "extern int $2;" >> symdummy.c; \
	    echo "$2 = 0;" >> symdummy.c.tmp; \
	    ;; \
    esac; \
done; \
echo "" >> symdummy.c; \
echo "}" >> symdummy.c.tmp; \
cat symdummy.c.tmp >> symdummy.c; \
rm -f symdummy.c.tmp
clang -m64 -I../../include -I. -I./slapi -I. -I../../include       -c -o symdummy.o symdummy.c
dlltool --dllname slapd.exe --input-def slapd.def --output-lib libslapd.a
echo /bin/sh ../../libtool --mode=link clang -static -m64     -Wl,--base-file,slapd.base -o slapd \
	main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res symdummy.o version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   ; \
/bin/sh ../../libtool --mode=link clang -static -m64     -Wl,--base-file,slapd.base -o slapd \
	main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res symdummy.o version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   
rm -f slapd.exe
echo dlltool --dllname slapd.exe --input-def slapd.def \
	--base-file slapd.base --output-exp slapd.exp; \
dlltool --dllname slapd.exe --input-def slapd.def \
	--base-file slapd.base --output-exp slapd.exp; \
echo /bin/sh ../../libtool --mode=link clang -static -m64     -Wl,--base-file,slapd.base -o slapd slapd.exp \
	main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res symdummy.o version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   ; \
/bin/sh ../../libtool --mode=link clang -static -m64     -Wl,--base-file,slapd.base -o slapd slapd.exp \
	main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res symdummy.o version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   
rm -f slapd.exe
echo dlltool --dllname slapd.exe --input-def slapd.def \
	--base-file slapd.base --output-exp slapd.exp; \
dlltool --dllname slapd.exe --input-def slapd.def \
	--base-file slapd.base --output-exp slapd.exp
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd slapd.exp symdummy.o main.o globals.o bconfig.o config.o daemon.o connection.o search.o filter.o add.o cr.o attr.o entry.o backend.o backends.o result.o operation.o dn.o compare.o modify.o delete.o modrdn.o ch_malloc.o value.o ava.o bind.o unbind.o abandon.o filterentry.o phonetic.o acl.o str2filter.o aclparse.o init.o user.o lock.o controls.o extended.o passwd.o schema.o schema_check.o schema_init.o schema_prep.o schemaparse.o ad.o at.o mr.o syntax.o oc.o saslauthz.o oidm.o starttls.o index.o sets.o referral.o root_dse.o sasl.o module.o mra.o mods.o sl_malloc.o zn_malloc.o limits.o operational.o matchedValues.o cancel.o syncrepl.o backglue.o backover.o ctxcsn.o ldapsync.o frontend.o slapadd.o slapcat.o slapcommon.o slapdn.o slapindex.o slappasswd.o slaptest.o slapauth.o slapacl.o component.o aci.o alock.o txn.o slapschema.o nt_svc.o ../../libraries/liblutil/slapdmsg.res version.o libbackends.a liboverlays.a ../../libraries/liblunicode/liblunicode.a ../../libraries/librewrite/librewrite.a ../../libraries/liblutil/liblutil.a ../../libraries/libldap_r/libldap_r.la ../../libraries/liblber/liblber.la  -lrpcrt4            -lregex  -lws2_32   \
	
rm -f slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema
for i in slapadd slapcat slapdn slapindex slappasswd slaptest slapauth slapacl slapschema; do \
	../../build/shtool mkln -s slapd.exe $i.exe; done
cd overlays; make -Bnw dynamic
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/servers/slapd/overlays'
make[3]: Nothing to be done for 'dynamic'.
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd/overlays'
if test NT = NT; then \
    sysconfdir=`cygpath -w /mingw64/etc/openldap | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    localstatedir=`cygpath -w /mingw64/var | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
    moduledir=`cygpath -w /mingw64/libexec/openldap | \
	sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g'`; \
else \
    sysconfdir=/mingw64/etc/openldap; \
    localstatedir=/mingw64/var; \
    moduledir=/mingw64/libexec/openldap; \
fi; \
sed -e "s;%SYSCONFDIR%;$sysconfdir;" \
	-e "s;%LOCALSTATEDIR%;$localstatedir;" \
	-e "s;%MODULEDIR%;$moduledir;" \
	./slapd.conf > slapd.conf.tmp ; \
sed -e "s;%SYSCONFDIR%;$sysconfdir;" \
	-e "s;%LOCALSTATEDIR%;$localstatedir;" \
	-e "s;%MODULEDIR%;$moduledir;" \
	./slapd.ldif > slapd.ldif.tmp ; \
touch all-cffiles
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/servers/slapd'
 
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/servers'
 
  Entering subdirectory tests
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/tests'
echo "Making all in `pwd`"
for i in progs ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory progs
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/tests/progs'
clang -m64 -I../../include -I../../include       -c -o slapd-tester.o slapd-tester.c
clang -m64 -I../../include -I../../include       -c -o slapd-common.o slapd-common.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-tester slapd-tester.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-search.o slapd-search.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-search slapd-search.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-read.o slapd-read.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-read slapd-read.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-addel.o slapd-addel.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-addel slapd-addel.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-modrdn.o slapd-modrdn.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-modrdn slapd-modrdn.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-modify.o slapd-modify.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-modify slapd-modify.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-bind.o slapd-bind.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-bind slapd-bind.o slapd-common.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o slapd-mtread.o slapd-mtread.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o slapd-mtread slapd-mtread.o slapd-common.o ../../libraries/libldap_r/libldap_r.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
clang -m64 -I../../include -I../../include       -c -o ldif-filter.o ldif-filter.c
/bin/sh ../../libtool --mode=link clang -static -m64     -o ldif-filter ldif-filter.o ../../libraries/libldap/libldap.la ../../libraries/liblutil/liblutil.a ../../libraries/liblber/liblber.la      -lregex  -lws2_32 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/tests/progs'
 
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/tests'
 
  Entering subdirectory doc
make[1]: Entering directory '/home/t-demcke/code/openldap_exp/doc'
echo "Making all in `pwd`"
for i in man ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory man
make[2]: Entering directory '/home/t-demcke/code/openldap_exp/doc/man'
echo "Making all in `pwd`"
for i in man1 man3 man5 man8 ; do 		\
	echo "  Entering subdirectory $i";		\
	( cd $i; make -Bnw all );		\
	if test $? != 0 ; then exit 1; fi ;	\
	echo " ";								\
done
  Entering subdirectory man1
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/doc/man/man1'
PAGES=`cd .; echo *.1`; \
for page in $PAGES; do \
	sed -e "s%LDVERSION%2.4.45%" \
		-e 's%ETCDIR%/mingw64/etc/openldap%g' \
		-e 's%LOCALSTATEDIR%/mingw64/var%' \
		-e 's%SYSCONFDIR%/mingw64/etc/openldap%' \
		-e 's%DATADIR%/mingw64/share/openldap%' \
		-e 's%SBINDIR%/mingw64/sbin%' \
		-e 's%BINDIR%/mingw64/bin%' \
		-e 's%LIBDIR%/mingw64/lib%' \
		-e 's%LIBEXECDIR%/mingw64/libexec%' \
		-e 's%MODULEDIR%/mingw64/libexec/openldap%' \
		-e 's%RELEASEDATE%2017/06/01%' \
			./$page \
		| (cd .; soelim -) > $page.tmp; \
done
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/doc/man/man1'
 
  Entering subdirectory man3
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/doc/man/man3'
PAGES=`cd .; echo *.3`; \
for page in $PAGES; do \
	sed -e "s%LDVERSION%2.4.45%" \
		-e 's%ETCDIR%/mingw64/etc/openldap%g' \
		-e 's%LOCALSTATEDIR%/mingw64/var%' \
		-e 's%SYSCONFDIR%/mingw64/etc/openldap%' \
		-e 's%DATADIR%/mingw64/share/openldap%' \
		-e 's%SBINDIR%/mingw64/sbin%' \
		-e 's%BINDIR%/mingw64/bin%' \
		-e 's%LIBDIR%/mingw64/lib%' \
		-e 's%LIBEXECDIR%/mingw64/libexec%' \
		-e 's%MODULEDIR%/mingw64/libexec/openldap%' \
		-e 's%RELEASEDATE%2017/06/01%' \
			./$page \
		| (cd .; soelim -) > $page.tmp; \
done
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/doc/man/man3'
 
  Entering subdirectory man5
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/doc/man/man5'
PAGES=`cd .; echo *.5`; \
for page in $PAGES; do \
	sed -e "s%LDVERSION%2.4.45%" \
		-e 's%ETCDIR%/mingw64/etc/openldap%g' \
		-e 's%LOCALSTATEDIR%/mingw64/var%' \
		-e 's%SYSCONFDIR%/mingw64/etc/openldap%' \
		-e 's%DATADIR%/mingw64/share/openldap%' \
		-e 's%SBINDIR%/mingw64/sbin%' \
		-e 's%BINDIR%/mingw64/bin%' \
		-e 's%LIBDIR%/mingw64/lib%' \
		-e 's%LIBEXECDIR%/mingw64/libexec%' \
		-e 's%MODULEDIR%/mingw64/libexec/openldap%' \
		-e 's%RELEASEDATE%2017/06/01%' \
			./$page \
		| (cd .; soelim -) > $page.tmp; \
done
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/doc/man/man5'
 
  Entering subdirectory man8
make[3]: Entering directory '/home/t-demcke/code/openldap_exp/doc/man/man8'
PAGES=`cd .; echo *.8`; \
for page in $PAGES; do \
	sed -e "s%LDVERSION%2.4.45%" \
		-e 's%ETCDIR%/mingw64/etc/openldap%g' \
		-e 's%LOCALSTATEDIR%/mingw64/var%' \
		-e 's%SYSCONFDIR%/mingw64/etc/openldap%' \
		-e 's%DATADIR%/mingw64/share/openldap%' \
		-e 's%SBINDIR%/mingw64/sbin%' \
		-e 's%BINDIR%/mingw64/bin%' \
		-e 's%LIBDIR%/mingw64/lib%' \
		-e 's%LIBEXECDIR%/mingw64/libexec%' \
		-e 's%MODULEDIR%/mingw64/libexec/openldap%' \
		-e 's%RELEASEDATE%2017/06/01%' \
			./$page \
		| (cd .; soelim -) > $page.tmp; \
done
make[3]: Leaving directory '/home/t-demcke/code/openldap_exp/doc/man/man8'
 
make[2]: Leaving directory '/home/t-demcke/code/openldap_exp/doc/man'
 
make[1]: Leaving directory '/home/t-demcke/code/openldap_exp/doc'
 
