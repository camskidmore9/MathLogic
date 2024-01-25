#!/bin/sh

echo ===========================================
echo Checking basic xor datastructures
echo All SAT
echo ===========================================


for i in ../tests/xortest.ite ../tests/xortest.xor
do
 echo -n "`basename $i` ... "
 PARAMS=
 if [ -f $i.params ] ; then
   PARAMS=`cat $i.params`
 fi
 ../src/sbsat --ini ../tests/emptyite.ini --debug 0 $i
 if [ $? != 0 ] ; then
    exit 1;
 fi
done

echo ===========================================
echo Done - Success
echo ===========================================

exit 0

