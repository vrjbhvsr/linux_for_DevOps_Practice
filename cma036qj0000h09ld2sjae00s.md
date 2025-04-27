---
title: "📈From Zero to DevOps: My Week 2 with Linux Commands🐧"
datePublished: Sun Apr 27 2025 20:01:31 GMT+0000 (Coordinated Universal Time)
cuid: cma036qj0000h09ld2sjae00s
slug: from-zero-to-devops-my-week-2-with-linux-commands
cover: https://cdn.hashnode.com/res/hashnode/image/upload/v1745784785534/3c7aca75-e888-4f28-9a2f-ec9eef24a8cf.webp

---

In my second week, I dove into more advanced topics, focusing on user management, file permissions, and file systems. Here’s what I learned:

## 💪 What I Learned This Week

**1. User Account Management👥**
I have learned how to switch between the users, how to create and manage users and groups using: 

* `sudo -i` to switch to root user
* `su - username` to switch to another user
* `useradd` and related flags to create users
* `usermod` to modify user attributes
* `groupadd` to create groups
* `passwd` to set the password for the users

**2. Linux File System📂**
I took a deeper dive into Linux file systems, focusing on the structure and organisation of files on disk. I explored:

- The differences between ext4, XFS and other file systems

- How inode works in managing file metadata

- The importance of block storage and its role in organizing file data

Understanding Linux file systems gave me insight into how data is stored and retrieved on disk, which is essential when working with larger systems or setting up new environments.

**3. Linux File Structure📂**
I explored the hierarchical layout of the Linux root directory (/).
I learned what each central directory is responsible for, including:

* /bin – Essential command binaries

* /sbin – System binaries for administrative tasks

* /usr – User programs and data (Unix System Resources)

* /etc – Configuration files for the system

* /home – Home directories for all users

* /var – Variable files like logs, spool files, etc.

* /tmp – Temporary files

* /dev, /proc, /sys – Special directories for device files and kernel information

Understanding the file structure helped me navigate the system more confidently and organise my work better as a DevOps learner!


**4. Types of Files 📚**
I understand the various file types in the Linux system and their uses.
The file types are:
- Regular Files (-)
- Directory (d)
- Symbolic link (l)
- Character Device files (c)
- Block Device Files (b)
- Named pipe or FIFO files (p)
- Socket Files (s)


**5. File Permissions🔐**
I learned about the importance of file permissions in Linux and how they control who can access and modify files:

- The reason to change the permissions:  Security 🛡️, Access Control 👨‍💻, Team collaborations 🤝,  Functionality ⚙️

- r (read), w (write), and x (execute) permissions for user, group, and others

- Using chmod to change file permissions

- Symbols like (+) to add and (-) to remove and (a) allow all(everyone) permissions.

Understanding file permissions was crucial to managing file access in a multi-user system and protecting sensitive data.

**6. User Permissions🧑‍💻**
I learned how to manage file and directory permissions for different users and groups.
Specifically, I practiced using:

- `chown` – to change the owner of a file or directory.

- `chgrp` – to change the group ownership of a file or directory.

This knowledge is crucial in a multi-user environment to control access, maintain security, and manage collaboration across different teams.

**7. Access Control List🛡️**
I explored Access Control Lists (ACLs), which provide more granular control over file permissions. I used:

* getfacl to view the ACLs of files

* setfacl to set permissions for specific users or groups

This was a great way to control permissions beyond the basic user/group/others model.

## What’s Next on the Journey?
###Next Steps 🚀
Now that I’ve covered the basics of file permissions, user management, and file systems, I’m ready to dive deeper into the following topics:

* Working with .tar files and compressed archives

* Mastering regular expressions for efficient text processing

* Understanding system processes, logs, and service management

* Exploring Linux networking for DevOps tasks

* Continuing with hands-on practice on AWS EC2 instances

## 🙌 Final Thoughts
My Learning Journey is just beginning, and I’m excited to see where this path takes me as I gain more experience in DevOps.

If you're on a similar journey, let’s learn together. 😊
Thanks for reading!