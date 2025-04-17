# 🐧 Linux File Commands Bash Script

This is a simple bash script where i practice simple file handeling commands.
With this i have learned how to get information of the files also how do we create and make changes within the file and how to automate common daily task using shell scripting.

## 🛠️ Commands I have covered in this script

* `pwd`
* `ls`
* `touch`
* `rm`
* `cat`
* `echo`
* `grep`
* `sort`
* `|`

**🔎I have also shown different flags used with `ls` commands**

| command | flag | Discription |
|---------|------|-------------|
|ls|-l| lists all the content along with authers, permission, size.|
|ls|-a| lists all the hidden content. |
|ls|-s| gives the size of content.|
|ls|-lsa| gives all info as above flags.|
|cat| -b| numbers the all non-blank lines.|
|cat| -n| numbers all the lines.|
|cat| -s| squeezez the blank line to one line.|
|grep| -i| used to get case insensitive search string.|
|grep| -v| returns the output that is not matched with search string.|
|grep| -n| returns the lines with numbers for matched search string.|
|grep| -c | returns the number of lines which has matched search string.|
|sort| -r | returns the output lines in reverse order.| 
|sort| -n | sorts the line numerically.|
```markdown
## 📄 What This Script Does

- Checks the present working directory
- list outs the content of the folder
- Displays file content
- Creates a file
- prints the content
- removes the files
```

## 📂 Script Overview
```bash
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
.
.
.
.
```

## ▶️ How to Run
```bash
chmod +x file_handling_commands.sh
./file_handling_commands.sh
```

## ✅ sample output
![Script Output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/working_with_files/filecmds.png?raw=true)

## What I learned? 💪
* How to create files?
* how to automate the script(basic)?
* how to visualize the file content?
* how to extract the patterns or string/word from the file?
* how to sort the results?


