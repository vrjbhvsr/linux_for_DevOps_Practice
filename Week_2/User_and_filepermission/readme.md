[....previous](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/Linux_File_system/Readme2.md)
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

> *This operations are represented as alphabatically as well as numerically. Read is represented by `r` and the numerically `4`, write is represented by `w ` and `2`, Excecute is represented by `x` and `1`.*

Let's see on the particular file how it is shown.

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/ops.png)

In the screenshot, we might notice different permission patterns like rw-rw--x or rwxrwxrwx.
Let’s break it down properly:

### ✅ Why rwx pattern repeats three times?

* First three characters (rwx) → User permissions (owner of the file)

* Next three characters (rwx) → Group permissions (members of the owner's group)

* Last three characters (rwx) → Others (everyone else)

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/permissions.jpg)

### ✅ How to read it?

* Each set is always in the order:
  
  r = read,
  w = write,
  x = execute.

  If a permission is missing, you’ll see a dash - instead meaning user is not allowed to perform that operations.

```bash
  -rw-r--r-- 1 ubuntu ubuntu  1234 Apr 26 09:30 myfile.txt
```

>  *When we see two ubuntu ubuntu after all the permissions, that shows the owner of that file and the group of that file.*


✅ **Quick Tip:**

**If you want to see only owner and group info neatly, you can also run:**


```bash
stat Week_1
```

Returns:

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/info.png)


## Now let's understand how to change the file permission.

* Before I start changing file permissions, it will be helpful for me to understand **why do we need to change the permissions.**

1️⃣ **Security 🛡️:**
    We don't want everyone to ready, modify, or excecute sensitive files.

2️⃣ **Access Control 👨‍💻:**
    Sometimes we only want certain people to perform file operations.

3️⃣ **Team collaborations 🤝:**
    In industirs where mostly there is multi-user environment, controlling who can do what avoids accidental damage.

4️⃣ **Functionality ⚙️:**
    Sometimes some files like shell scripts requires correct permissions to run it properly.

The below screenshot shows that as **peter** user i want to open the **ubuntu's** home directory and here what it does....

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/pd.png)

It shows permission denided, well ofcourse as peter i can't explore ubuntu's home. but what if **ubuntu** allows other users to visit his home? 

**let's do that:**

✅ As any user, check home directory permission.

✅ As ubuntu user, allow other user to read and excecute the files but not write,  using `chmod` command.

> *In the case of directories, to enter a directory (cd into it), you must have execute (x) permission on that directory. Read (r) permission alone lets you see the names of files (if you could list), but without execute (x), you cannot cd into the directory.*

```bash
chmod o+rx ubuntu

# Or

chmod 755 ubuntu 
```

✅ Switch to peter user.

✅ Check if we can go to ubuntu's home.

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/pg.png)


**Same way, we can change the permissions of the files or scripts. But in the command `chmod o+rx ubuntu`, we know that rx are used for read and excecute but what is **o+**.**

* So, `o` = others, `u` = user, `g` = group.
* `+` is to add permission.
* `-` is to remove permssion.
* `a` is to append permssion to all users, group, others.


![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/pg.png)

As we can see from the image above, The file, hello.sh, has permission set for others as read and excecute. In result, Vraj as user could run and excucute the script but failed to make any modification.

Below screenshots revels another command and it's working, which is relatively easy to understand.

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/asvraj.png)
![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/aspeter.png)

