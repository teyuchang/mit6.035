#!/bin/sh

filename=`basename $0`
testcases=`ls -p . | grep -v / | grep -v $filename`
com="java -jar ../skeleton/dist/Compiler.jar -target scan -debug "
tardir="result/"
ansdir="output/"
for t in $testcases
do
	eval "$com$t > $tardir$t.out" 

	echo $t
	diff $ansdir$t".out" $tardir$t".out"

done
