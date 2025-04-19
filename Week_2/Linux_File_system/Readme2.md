[⬅️......previous](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/edit/main/Week_2/Linux_File_system/Readme.md)

# 🐧Linux File Structure🗃️
 🎋 The linux file system follows a heirarchical file structure So, it must be organized in the form of a tree. 
 
At the very beginnig of this tree, sits a root directory as we know represented as `/` symbol. Every single file or Direcotry - no matter where it is located - starts from this root folder

**The following image gives better understanding about heirachical structure and serves as a guide to learn about various files and folder under the root direcotry.**

![Image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/linux-filesystem.png)


## 📂 /bin (Binary Excecutable)
`/bin` folder means the binary folder. The essential  -command line programs(binaries)- which is called binary excecutables needed for basic system operations like, interacting with system and maintaining it, are stored in this folder.
The basic commands or binaries that we use such as, `ls`, `pwd`, `rm` are stored here.

**Point to remember:**
> * it is part of root dir `/`.
> * It contains all the essential commands used for system booting and recovery.
> * All these commands are binary excecutable files stored in this folder.
> * These commands can be used by root user as well as all other users.

So, when we write command `ls`, its not that we are giving instruction to kernel. The kernel runs the compiled program named `ls` to perform listing operation.

### 🤔 Question❓: How it processes any command?
* First, when we write:
  
```bash
ls
```
We are not asking kernel to list the files present the directory. 
**Instead, we ask shell:**
* ▶️ To find the command `ls` from the directories listed in `$path` environmental variable.
* ⏭️ Once it find the path, it finds the binary excecutable which is `/bin/ls`.
* ⏭️ Then shell asks the kernel to load and run by using system call(mostly written in C) `execve`.

⏭️ Now The kernel takes over the process,
* it loads and run the binary
* gives CPU the time
* runs the program and excecute it as a process.

**This process then:** 
* Interact with the file system
* Fetch the list of files
* Display it.

## 📂 /opt (optional)
The opt directory in the root folder is stands for optional directory. 

**This folder:**
* ☑️ Does not contain any file that is essential for the system.
* ☑️ Contains third-party, external software packages and applications such as `Google Chrome`, `JAVA`.
* ☑️ Keeps the external software and application isolated from the core system files and folders like `/bin`, `/usr`.
* ☑️ Keeps this third party software packages organized

> *🧠 This folder only keeps external software and application which manually installed and not installed using `yum` or `apt`.*
### 🤔 Question❓: Where does this external software packages and applications go?
If installed using `yum`, `apt` or `dnf`:

* Binaries stroed into /bin or /usr/bin or /usr/sbin
* Libraries stored into /lib or /usr/lib
* Config files stored into /etc
  
> This structure keeps things modular and follows the Filesystem Hierarchy Standard (FHS).

**When we install manually using `.run` or `.sh` or with any program like Python or JAVA, it stored in `/opt`**
