#!/bin/bash


echo "Create a dir using 'mkdir'"
mkdir example_dir

echo "check the list of the files and dirs."
ls
echo "
"
echo "creating new file for practicing commands"
touch triangle.py

echo "check the list of the files and dirs."
ls
echo "
"
echo "Move the file to new directory, we use mv command"
mv triangle.py /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/example_dir

echo "check the list of the files and dirs."
ls
echo "
"
echo "To change the directory, we uae 'cd' command."
cd example_dir

echo "check the present working dir."
pwd
ls
echo "
"
echo "if we use command without specifying any dirname or 'cd ~', it will take us to home directory"
cd

echo "check the present working dir."
pwd
echo "
"
echo "Again changing the home direcotry to example_dir"
cd /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/example_dir


echo "check the present working dir."
pwd

echo "
"

echo "To go to the previous dir, we use
cd .."
cd ..

echo "check the present working dir."
pwd

echo "
"

echo "When we use 'cd/~' it will take us to the root dir"
cd /

echo "check the present working dir."
pwd

echo "
"

echo "Again changing the home direcotry to example_dir"
cd /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/example_dir

echo "check the present working dir."
pwd

echo "let's go to previous dir"
cd ..

echo "we can remove the directory by using 'rmdir' function"
rmdir example_dir

echo "
"

echo "The above command gave an error because the example dir is not empty. To remove directory with the content present in it we can simply use 'rm' command with '-r'(recursive) flag.
rm -r example_dir"
rm -r example_dir

echo "check the present working dir."
pwd

echo "
"

echo "let's create a new directory to firm the understanding for 'rm' command."
mkdir exaple_dir
ls


echo "
"

echo "Now new exaple dir is empty and can be removed with 'rmdir' function"
rmdir exaple_dir
ls

echo "Introducing 'cp' command. we use this command to copy files and directories."

echo "create new directory to practice 'cp' command."
mkdir example_dir
touch application.py
ls

echo "
"

echo "copying file to example_dir"
cp application.py /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/example_dir

echo change the directory to example_dir and check in the list of files application.py is present or not
cd example_dir
pwd
echo "
"
ls

echo Now, let's dive into copy command with it's flag

echo "
"

echo "First we will use the '-i' flag. when we use '-i', it asks us if we want to overwrite the file if the directory has the file with same name."
cp -i /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/application.py .

echo "
"

echo "copying other files also"
cp -i /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/My_plan.txt .

echo "
"

echo "We will use next flag which is '-n'. If there is a file with same name already exsist in the directory, it does not overwrite it or it does not change the original file at destination.
cp -n /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/application.py ."
cp -n /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/My_plan.txt .

echo "

Here when we see My_plan.txt in the example_dir folder, There won't be any changes.

"

echo " '-u' flag is used to overwrite the destination file with the same name if content in the file is different."
cp -u /home/ubuntu/Devops/linux_for_DevOps_Practice/working_with_dirs/My_plan.txt .

echo "

After applying -u flag you will see there is changes in the My_plan.txt

"
