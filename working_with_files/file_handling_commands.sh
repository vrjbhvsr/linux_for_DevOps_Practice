#!/bin/bash
echo "The current directory is:"
pwd

echo "
"


echo "Let's checkt the list of files present in the directory."
ls

echo "
"
echo "creating new file in the directory using 'touch' command: 
touch new_text_file.txt"
touch new_text_file.txt

echo "

"
echo "check again if the file is created or not?"
ls

echo "
"
echo "Now, let's see how to remove files using 'rm' command."
rm new_text_file.txt

echo "
"

echo "if we want to write the message in a new file and print the message on termainal at the same time we can use '>' along with echo command.:
echo "Hello, i am working as a DevOps Engineer." > another_text_file.txt"
echo "Hello, i am working as a DevOps Engineer." > another_text_file.txt

echo "
"

echo "check again the list of files"
ls

echo "
"

echo "To see if the above message is written in the file or not we use 'cat' commmand."
cat another_text_file.txt

echo "
"


echo "we can use this commands with different 'flags'. for example: 'ls -l' will give us the list of file with the details."
ls -l

echo "To see the hidden files present in the directry. we use -a flag with ls command."
ls -a
echo"
"
echo "To check the size of file we can use '-s' flag with ls."
ls -s

echo "
"

echo "To check all the details, hidden files, and the size of files, we can use -lsa flag."
ls -lsa

echo "
"

echo "if we want to create a file and want something from the user or we want to write in the file at the same time of file creation we can use 'cat > filename.txt'."
cat > new_example.txt

echo "To remove multiple files, the same 'rm' command used.
rm another_text_file.txt new_example.txt"

rm another_text_file.txt new_example.txt

echo "check again the list of files."
ls
