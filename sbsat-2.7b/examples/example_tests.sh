#!/bin/sh

echo ===========================================
echo Checking example tests
echo ===========================================

for i in ../examples/*.???
do
 echo -n "`basename $i` ... "
 PARAMS=
 if [ -f $i.params ] ; then
   PARAMS=`cat $i.params`
 fi
 ../src/sbsat --ini ../tests/emptyite.ini --debug 0 $i $PARAMS
 if [ $? != 0 ] ; then
    exit 1;
 fi
done

echo ===========================================
echo Done - Success
echo ===========================================

exit 0

