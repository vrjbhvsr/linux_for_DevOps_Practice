[⬅️......previous](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/Linux_File_system/Readme.md)

# 🐧Linux File Structure🗃️
 🎋 The linux file system follows a heirarchical file structure So, it must be organized in the form of a tree. 
 
At the very beginnig of this tree, sits a root directory as we know represented as `/` symbol. Every single file or Direcotry - no matter where it is located - starts from this root folder

**The following image gives better understanding about heirachical structure and serves as a guide to learn about various files and folder under the root direcotry.**

![Image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/linux-filesystem.png)


## 📂 /bin/ (Binary Excecutable)
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

## 📂 /opt/ (optional)
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


## 📂 /boot/ 
* The boot dir in the root folder helps the system to start. It's like an ignition system in the car,to get the engine running.
* This folder contains all the necessary files that are required to start(boot) the system before main operating system takes the power.

**In this folder, we have:**

* `vmlinuz` : It is the compressed linux kernel, which is the core of the OS.
* `initrd` or `initramfs` : This is the temporary initial ram disk that is loaded into memory to start the system.
* `grub` : This is a bootloader folder which decides which version of the kernel is to use.
* `system.map` : Symbol table for the kernel — helps with debugging.
* `config-***` : The kernel's build-time config. Useful for developers.

![boot img](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/boot.png)

> *🧠Usually, This `/boot/` folder is mounted on it own separate partion of the Disk. By doing this we protect our krenel from any modification or from getting affected by the system crashes or corruption in the root folder.*


## 📂 /root/

This folder is for the king of the castle means, this folder is for the root user(The main user).

* This folder has all the personal files, configs stored.
* When root user logs in they are droped in to this directory.
  
> *🏠 "/root" is like the home directory of the root (admin) user — just like /home/username is for regular users — but with full system access.
>🔐 Only root has access to /root.
>🛡️ Root can read/write/modify any file or folder on the system, unlike regular users.*

  
![boot img](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/root.png)

## 📂 /dev/

This folder in the root direcotry stands for device files. As I discussed earlier, linux is all about files, even hardware is also stored as files. When OS want to interact with devices it reads/writes to this files.

The folder `/dev/` contains the files that represents the devices attached to the system such as, Disk, USB drive, keyboard, mouse.

![dev img](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/dev.png)

* This screenshot shows the files that are stored in `/dev/` folder. The list can be different depending on devices attached to one's system.
* On this EC2 instance, virtual disks/partitions are attached which is shown as xvda, xvda1,xvda16,..., while on local machines it can be `/dev/sda`.
* `/dev/tty` files are related to the terminal devices.
* The devices that help to mount disk images that also can be found here, `loop`, `loop1`,...

## 📂 /sbin/

The /sbin folder stands for System Binaries. It contains binary files used for system booting, recovery, and maintenance. These commands are typically intended for the root user (or superuser) and are not meant for regular users.

The path of this folder is not usually available in `$path` system variables, so regular user cannot access it accidently.

Some of the commands i'm mentioning here that are store in sbin folder.

* ☑️ `fsck` : checks and repair file systems
* ☑️ `reboot`: rebbots the system.
* ☑️ `shutdown` : shuts the system safely.
* ☑️ `iptables`: manages firewall rules.
* ☑️ `mount`/`umount` :  mounts or unmounts filesystem.


## 📂 /etc/

This directory is the configuration directory resides under the root directory. It contains all the system-wide configuration files and shell scripts that are used to boot the system and initialize it. All the configurations related to user or services are stored here.

* Again, Only root user can modify most of the files here.
* Every services that we have install in the system stores it configurations in this folder.
* If we want to change the system's behaviour we edit this configuration files.

**Inside /etc/**

```bash
cd /
ls /etc
```

* `passwd` :  Where all the information about users (user account) are kept.
* `shadow` : stores secure encrypted passwords.
* `network` : Stores network configurstion files.
* `systemmd/` : System startup and serviece management config.


## 📂 /srv/

This folder in the root directory stands for service data directory. This folder store the data from the services that are provided by the system.
Imagine, that are running a web server on linux box, the files like html files, css files are stored inside /srv/http(www) directory. If we are running FTP server these files would go to /srv/ftp.


## 📂 /home/

In `/home/` directory resides all the user-specific information and configurations.
**In simple words, it's a personal locker room for each user.**

* Nomal user have write access to only their own directory `/home/user`.
* Personal files such as Downloads, Documents, and pictures are stored in user-specific directory.
* Application data or configuration files such as, browser setting, shell prefrences.


## 📂 /tmp/

This folder is a temporary storage location for short lived files that are generated from the system rebuild or by any application.

**These files can be:**

* Browser cache
* installer files
* logs during software builds

**All these files are**
* Deleted by the system at every reboot
* or deleted by the system after sometime.

## 📂 /lib/

In this folder, all the helper files needed for the essential system programs found in /bin or /sbin are stored. 

**Files, such as**
* C standard libraries(.so files)
* math libraries
* Device related libraries
* Some linux system stores kernel modules
  
![dev img](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/lib.png)

## 📂 /usr/

The usr here is short for Unix system resources, it's one of the most important and large directory. All the files that contains user space data, everything that are not essential for system booting or minimal system operations.

It contains the programs, libraries, documents and other data that is used by the normal user and system software after system has booted.

**It contains folders like: **
* `/bin` : User commands like **vim, python, ls**
* `/sbin` : system tolls like **useradd, sshd**
* `/include`: all the header files such as **C headers**
* `/lib`:  shared libraries for **/bin or /sbin**

All this folder that are present in root directory but the commands are different.

## /media/
When additional removable devices such as pendrive, cd, or USB drive are inserted to the system /media automatically mounts these devices on the system. In other words when we plug in pen drive or SD card, the system typically created a subdirectory under the /media with the namee of device for instance, `/media/username/MyUSB'.

> *This process is handles by `udev`, and `udisk` or desktop environments like GNOME or KDE. Usually this directory is used for automatically mounted devices not for manual mount.*


## 📂 /mnt/

This directory has the similar working as /media but it is used for manual mount. Device like Second SSD where we want to mount temporaray file systems, that creates mount point under the /mnt folder.

**Takeaways: **
* Used when we want to access new partition or external diisk.
* We manually create a folder under /mnt and mount the  device there.

```bash
sudo mkdir /mnt/backup
sudo mount /dev/sdb1 /mnt/backup
```

## 📂 /var/

var stands for variable, used to store the files and logs that changes frequenty during normal system operations. This folder contains system generated data that changes over time such as log rotations, package installations...

Subdirectory | Purpose |
-------------|---------|
/var/log     | System logs — like authentication, boot logs, etc.|
/var/tmp | Temporary files that need to persist across reboots (unlike /tmp)
/var/cache | Cached files from applications or package managers
/var/spool | Queued tasks like print jobs, mail, or cron jobs
/var/lib | Application state info — e.g., databases, system daemons
/var/www | Default location for web server files (like for Apache/Nginx)
/var/run → /run | Info about currently running system processes


Now, That we have learned about 
