# 🐧 Linux File System📂
What I understand about linux is, it is a **FILE**. Yes, it is a file which has so many files and directories which help Linux system to operate.

**Linux is a file-based operating system.**
> ☑️ Everything in linux trated as files. Not only Documents but,
> * Directoris
> * processes
> * configurations
> * binaries

Everything above is stored as files. The commands like `ls`, `pwd` that i have used in my practice that is also nothing but files. Now, to use these commands efficiently linux stores these files in structured and heirachical way.

## Formal Definition
* OS stores and manages data on disk or patitions using a structure called file system.

## 🔡Types of File System**
A file system determines how data is stored, organized, and retrieved from a storage device like a hard drive, SSD, or USB stick.
There are few popular file systes that i am mentioning below:

### 👪ext2/ext3/ext4 (Extended file system family):
**📦ext2(second extended file system):**
  This system is very old, introduced around 1993. It is fast but performance is not good. It doesn't provide journaling means it is less reliable when system crashes. In simple words there is no backup system.
    
  ***Use case:*** Flash drives where performance is more critical then reliability.

**📦ext3(Third extended file system):**
This system is similar as ext2 but provides journaling. It is slower compared to ext2.

***Use case:*** Legacy systems that need journaling but don’t need ext4 features.

**📦ext4(Fourth extended file system):**
This system provides journaling, performance and stability. It is most poppular in linux toady. Distributions like Ubuntu, debian uses this system. It can handle huge files upto 16TB and volumes upto 1EB.

***Use case:** Commonly used as default file system in modern distros like Ubuntu.

### 📦XFS 🥇
This file system is high performance file system for large files, Databases, log-heavy applications. It provides journaling and is better for I/O operations. It supports files upto 16EB which is very huge.

***Use case:*** Red hat-based systems like centOS

### 📦 Btrfs(B-tree File system)
This file system provides advanced features like snapshots, checksums, compression. This system is designed for scalability.

***Use case:*** Systems requiring snapshotting, versioning, or built-in RAID (like openSUSE or Fedora).

> There are other file systems also such as FAT32, exFAT, NTFS but each of these has its own pros and cons. The above mentioned FS are widely poppular and used.

To check which file system my linux distro uses there are few commands that gives me info about it.

```bash
df -Th
lsblk -f
mount | grep '^/'
```
