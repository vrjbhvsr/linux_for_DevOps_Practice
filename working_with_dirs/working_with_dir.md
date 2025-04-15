# 🐧 Linux Directory Commands Bash Script
I have created a simple bash script, where i have practiced simple but very useful commands that is helpful for handling directories.

## 🛠️ Commands that i have covered in this script
* `mkdir`
* `mv`
* `cd`
* `rm`
* `rmdir`
* `cp`

**🔍I have also covered flags associated with commands. I have shown all the flags and it's uses below in the table**

| Command  | flag|Description                             |
|----------|-----|----------------------------------------|
| `rm`     | -r  |deletes directory and it's content      |
| `rm`     | -ri |deletes directory and it's content with permission           |
| `cp`     | -i  |copy and overwrite the file to destination with permission        |
| `cp`     | -n  |does not overwrite the file                 |
| `cp`     | -u  |overwrites the file if the content of the file is different            |
| `cp`     | -R  |Recursive copy, copies hidden files also |
| `cp `    | -V  | shows the informative messages while copying |
| `cd folder_name`    |     |change dir to that folder name|
| `cd`|                | change dir to home dir|
| `cd /` |          | change dir to root dir |
| `cd ~` |          | change dir to home dir |


## 📄 What This Script Does
```
- creates new dir
- removes dir
- changes dir
- coppies file and file contents
- moves files and directories to one location to other
```

## 📂 Script Overview
```bash
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
```
## ▶️ How to run
```bash
chmod +x dir_commands.sh
./dir_commands.sh
```

## ✅ Sample output
![Script Output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/working_with_dirs/dircmds.png?raw=true)

## What I learned? 💪
* How to create directories?
* how to moves file and directories?
* how copy command and it's flag works?
* How to remove directories recursively?
