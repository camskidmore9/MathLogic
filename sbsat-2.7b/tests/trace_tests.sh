#!/bin/sh

echo ===========================================
echo Checking basic trace file datastructures
echo and+, and- and are_equal SAT otherwise UNSAT
echo ===========================================

for i in ../tests/trace_tests/*.trace 
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

