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

**I have also shown different flags used with `ls` commands**

* `ls -l`, `ls -a`, `ls -s`, `ls -lsa`

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

