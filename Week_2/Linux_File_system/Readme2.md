[⬅️......previous](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/edit/main/Week_2/Linux_File_system/Readme.md)

# 🐧Linux File Structure🗃️
 🎋 The linux file system follows a heirarchical file structure So, it must be organized in the form of a tree. 
 
At the very beginnig of this tree, sits a root directory as we know represented as `/` symbol. Every single file or Direcotry - no matter where it is located - starts from this root folder

**The following image gives better understanding about heirachical structure and serves as a guide to learn about various files and folder under the root direcotry.**

![Image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/linux-filesystem.png)


## 📂 /bin (Binary Excecutable)
`/bin` folder means the binary folder. All the basic important commands -command line programs(binaries)- needed for basic system operations are stored in this folder.
The basic commands or binaries that we use such as, `ls`, `pwd`, `rm` are stored here.

**Point to remember:**
> * it is part of root dir `/`.
> * It contains all the essential commands used for system booting and recovery.
> * All these commands are binary excecutable files stored in this folder.
> * These commands can be used by root user as well as all other users.

So, when we write command `ls`, its not that we are giving instruction to kernel. The kernel runs the compiled program named `ls` to perform listing operation.

> 🤔 A question❓: How it processes any command?
* First, when we write:
  
```bash
ls
```
We are not asking kernel to list the files present the directory. Instead, we ask shell to find the command `ls` from the directories listed in `$path` environmental variable. ⏭️ once it find the path, it finds the binary excecutable which is `/bin/ls`. ⏭️ Then shell asks the kernel to load and run by using system call(mostly written in C) `execve`.

⏭️ Now The kernel takes over the process,
* it loads and run the binary
* gives CPU the time
* runs the program and excecute it as a process.

This process then interact with the file system to fetch the list and diplay it.
