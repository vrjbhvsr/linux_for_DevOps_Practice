# 📂 Archives, Compression, and Backup

## Archives:
* When we are working with **large number of files**, there might be necessity to **transfer/move files** from one place to another.
* Moving too many individual files togather is **not a good practice** and that's where **archiving** comes into picture.
* Archiving, in easy words, means **bundling multiple files** together into a **single file**.

> **Example:**
> Suppose we have file1, file2, file3, and file4, and we want to move or transfer them. We can create a bundle of these files and turn them into one archive file, like files.tar.

## 🛠 Learning tar — the king of archiving on Linux

Tar stands for Tape Archive.

### Commands for creating, extracting and viewing a tar file:

```bash
# To create a tar file

tar -cvf archive_name.tar folder_name/
```

**Here, -flags:**

* `c` means create
  
* `v` means verbose to show the progress
  
* `f` means file

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/tarc.png)

```bash
# To view the tar file content

tar -tvf archive_name.tar
```

**Here, -flags:**

* `-t` means list contents

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/tart.png)

```bash
# To extract the tar file content

tar -xvf archive_name.tar
```

**Here, -flags:**

* `-x` means extract contents

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/tarx.png)


## Compression

* When we create an archive of large files, we might face storage issues in the future due to the large size of the archive.

* Additionally, transferring a bundle of large files can slow down the process, making file transfer inefficient.

* To overcome these issues, we need to compress the archive file, which reduces the size of the file and allows us to utilize storage space more efficiently.

>Example:
>
>If we have a large archive like files.tar, we can use compression tools (like gzip or bzip2) to reduce the size of the file, turning it into a more manageable size such as files.tar.gz.


## 🛠 Adding Compression to tar

Compressing means reducing the size of the tar file and save the space.

```bash
# To create a zip of tar file

tar -czvf archive_name.tar.gz folder_name/
```

**Here, -flag**

`-z` means using gzip for compression

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/tarcx.png)

```bash
# To extract a zip of tar file

tar -xzvf archive_name.tar.gz
```

### Compression using bzip2

This works the same way as gzip but gives better compression.

```bash
# To create a zip of tar file

tar -cjvf archive_name.tar.bz2 folder_name/
```
![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/bzip2.png)


**Here, -flag**

`-j` means using bzip2 for compression



```bash
# To extract a zip of tar file

tar -xjvf archive_name.tar.bz2
```

## 🛠 Working with gzip, gunzip, zip, and unzip directly

We can also zip and unzip one single file and multifiles using gzip and zip with creating bundel or tar.

```bash
gzip filename

# and

zip archive.zip file1 file2 file3 folder1
```

**Unzip:**

```bash
gunzip filename.gz

# and

unzip archive.zip
```


## Backup🛡️

Backing up is an imporant in Devops, especially ensuring that configuration, logs, and important files are safe and easily recoverable in case of system failure, misconfiguration, or accidental deletion. 

The process is nothing but creating a copy of data to restore it when needed(extracting).
**This typically involvs:**

1. Archiving – combining multiple files or folders into one file (e.g., using tar)

2. Compressing – reducing the size of that archive for storage or transfer (e.g., using gzip, bzip2)

3. Storing – saving it in a secure location (e.g., external drive, cloud, remote server)

✅ Restoring the backup simply means extracting the archived and compressed file using tools like tar -xvzf.

**Things that I'll expolore in backup:**

* Creating a full Backup

* Excluding files from Backup

* Restore Backups

* Create INcreamental Backup

* Backup Automation with Cron

### 🛠 Creating a Full Backup

I want to backup the Ubuntu's home directory. The simplest way of doing it is using **tar**.

```bash
tar -czf ubuntu_backup.tar.gz /home/ubuntu             # I'm not using verbose -v flag
```

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/bkp.png)



### 🛠 Excluding files from Backup

I have tried with verbose flag and it gave me really long progress status and i noticed that .git files are also backed up, Which i dont want. We can exclude certain files from Backup.

```bash
tar --exclude='*.git' --exclude='.webp' -czvf ubuntunewbackup.tar.gz /home/ubuntu
```

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/ebkp.png)
