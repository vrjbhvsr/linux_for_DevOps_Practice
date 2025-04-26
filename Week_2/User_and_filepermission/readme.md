# User and File Permission in Linux🐧

When we are using open source Operating system, where multiple users are part of one host system, understanding user and file permission is very neccessary for system security and resource control. 
As I already understand how manage and create multiple users(User account management), now it's time to understand how to handle different files and directories that belong to another user. For example what types of files are there and who can access these files.

**🔦In this section I will explore,**
* Types of files
* commands for file permission
* commands for user permission
* Access Control commands

## Types of files📂

In linux, everything is a file but all these files have different types. we can check the file type using `ls -l` command 

```bash
ls -l
```

### Regular files
Files that are documents, text files, binaries, script all are considered as regular file. 

Regular file has sign of (-) when you check the list of files using above command.

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTR.png)


### Directory
These are folder that contains files or another folders.

Directoris are shown with (d) when you check the list.


![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FT.png)

### Symbolic Link

This is a file or directory as a short cut for another file or directory.

it is represented as (l).

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTL.png)


### Character device files

These are the files that allows communication with hardware one character at time like a stream.

These files are commonly used for devices like keyboard, mic, terminal etc.

These files are usually located in /dev/ directory. These files starts with (c) in the list.

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTC.png)

### Block device

Unlike character device files, these file communicate with fixes size bolcks.

These files are used for storage devices like SSD, hard drives etc.

These files are represented using (b) and typically found in /dev directory.

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTB.png)

### Named pipe or FIFO

These files also known as FIFO files are used for inter process communication, meaing they allow two processes to communicate with each by reading or writing to a file without storing actual data.

This file can be created using command like `mkfifo`.
This files are represented with (p).

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTP.png)

### Socket file
These files are used for the same purpose as Named pipe files but they are more powerful and flexible. 

These files allows bidirectional communication between two processes either on Same machine or over the network.

this files are shown with (s).

## File permissions

Now, I have strengthend my knowledge in file system and file types let's start learning what type of permission are there to access the files.

**There are three types of operations a user can do and User can perform these operation based on whether he has a permission to perform those operations?**

**The operations are:**
* Read - r 
* Write - w
* Excecute - x

> *This operations are represented as alphabatically as well as numerically. Read is represented by `r` and the numerically `4`, write is represented by `w ` and `2`, Excecute is represented by `x` and `1`.

Let's see on the particular file how it is shown.

![image]((https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/FTP.png)
