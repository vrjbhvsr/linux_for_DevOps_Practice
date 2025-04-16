#!/bin/bash

echo "I am starting this script with 'cat' command. As i shown in previous file 'cat' is used to show the file content.
"
cat abtme.txt
echo "
"

echo "We can append new information or lines with 'cat' command only with '>>' sign.
cat >> abtme.txt"
cat >> abtme.txt

echo "
"

echo "'-b' along with cat command will number all the non-blank lines"
cat -b abtme.txt

echo "
"

echo "with '-n' flag we can add the numbers to all lines"
cat -n abtme.txt

echo "
"

echo "with '-s' flag we can squeeze the blank line into one line"
cat -s abtme.txt

echo "
"

echo "Now, let's practice with 'grep' command. This command will find the pattern string/word in the file.
grep I abtme.txt."
grep I abtme.txt

echo "
"

echo " '-i' flag is used along with grep command help to get case insensitive string or words."
grep -i learning  abtme.txt

echo "
"

echo " '-n' flag with grep command return the string with line numbers."
grep -n learning abtme.txt

echo "
"

echo " flag '-v' with grep command return the string that is not matched with the search string."
grep -v learning abtme.txt

echo "
"

echo "grep command with '-c' flag will return the number of lines matched with search string."
grep -c learning abtme.txt

echo "
"

echo "Now, practicing with 'sort' commannd. This command will sort the file content with alphabetical or numerical order."
sort abtme.txt

echo "
"

echo "same way we can sort output of mutliple files together.
sort abtme.txt file1.txt file2.txt"

echo "
"

echo "sort command with '-r' flag will returns output in reverse order."
sort -r abtme.txt

echo "
"

echo "working with pipe command, '|'"
grep learning abtme.txt | sort

echo "
"

