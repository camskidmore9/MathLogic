#!/bin/sh

echo ===========================================
echo Checking longer benchmarks
echo you may interrupt it any time
echo All SAT
echo ===========================================

for i in ../tests/cnf/*.cnf
do
 echo -n "`basename $i` ... "
 PARAMS=
 if [ -f $i.params ] ; then
   PARAMS=`cat $i.params`
 fi
 ../src/sbsat --debug 0 --ini ../tests/emptyite.ini --ctrl-c 0 $i $PARAMS
 if [ $? != 0 ] ; then
    exit 1;
 fi
 echo -n "`basename $i` (simple_solver) ... "
 PARAMS=
 if [ -f $i.params ] ; then
   PARAMS=`cat $i.params`
 fi
 ../src/sbsat --debug 0 --ini ../tests/emptyite.ini --ctrl-c 0 $i $PARAMS -t --lemmas 1 --max-solutions 0
 if [ $? != 0 ] ; then
    exit 1;
 fi
done

echo ===========================================
echo Done - Success
echo ===========================================

exit 0

