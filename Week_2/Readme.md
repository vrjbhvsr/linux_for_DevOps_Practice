# 🐧 Linux User Account Management 🔐
Before creating or managing users in Linux, it's super important to understand what users are and how switching between them works.

## 👥 What are users in Linux?
Users, in Linux, are accounts that can access and operate system.
> **Each users has,**
>  * A username
>  * A home directory
>  * A unique user ID(id)
>  * Specific permissionS and ownships

## 🔄 Switching Between Users
We can switch between two users using two commands.

### **1️⃣ su - Substitute User**
```bash
su - username
```
 ✅ This command will switch from current user to given username but before that it will ask for password for that username.

 ✅ If no username provided, it will switch to root user if its allowed.

>  *💡 It is important to note that we can temporarily switch to root user because of safety reasons. To switch to root user we can use `su -i` command.*

### **2️⃣ sudo - Superuser Do**
As I am using AWS EC2 instance, I am not a root user. In this case I still have privilage to use root users commands by using `sudo` command. It temporarily grant a user administrative rights.

❌ For example, I tried to install vim editor as ubuntu user without using Sudo command and it gave the error message in return.
![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/apt.png)

▶️ To install vim editor by not being a root user:
```bash
sudo apt install vim
```
🩺 To check which user are we? we can use the following command
```bash
whoami
```


