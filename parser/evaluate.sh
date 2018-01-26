#!/bin/bash

filename=`basename $0`
testcases=`ls -p . | grep -v / | grep -v $filename`
com="java -jar ../skeleton/dist/Compiler.jar -target parse -debug "
for t in $testcases
do
	output=`$com$t` 
	rc=$?
	if [[ "$t" = "illegal"* ]] && [[ $rc == 0 ]]; then
		echo $t
		echo $output
		echo
	fi
	if [[ "$t" = "legal"* ]] && [[ $rc != 0 ]]; then
		echo $t
		echo $output
		echo
	fi

done
