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

>  *💡 It is important to note that we can temporarily switch to root user because of safety reasons. To switch to root user we can use `sudo -i` command.*

### **2️⃣ sudo - Superuser Do**
As I am using AWS EC2 instance, I am not a root user. In this case I still have privilage to use root users commands by using `sudo` command. It temporarily grant a user administrative rights.

❌ For example, I tried to install vim editor as ubuntu user without using Sudo command and it gave the error message in return.
![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/apt.png)

▶️ To install vim editor by not being a root user:
```bash
sudo apt install vim
```
🩺 To check which user are we? we can use the following command
```bash
whoami
```

## 👥Creating Users 🗝️
Now, I am ready to understand how user is created, and how to manage users?
For that, I have to first become the root user. I have to use `sudo -i` command as I don't have the password of the root account, I can not use `su -` command. Also, I don't want to write sudo before each command.

**🏃‍♂️‍➡️To get administrative access of root user:**
```bash
sudo -i
```
**↩️ Before:**

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/ubuuser.png)

**↪️ After:**
![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/rtusr.png)

**🫅 Now, I have root user privilage, let me create first user now.**

### **1️⃣ `useradd`** is the command to create a user.

```bash
useradd newuser
```
By default this command create user, and groups it with the same username and assign that group to new user. Below screenshot will give better idea what I've understood.
> *✍️Note: This command does not create any home directory and we will not be able to view any foolder in home directory.*
> 
> *💡Tip: To check user is created or not we can use `id newuser`.*

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/newusr.png)

### **2️⃣ `useradd` with flags**

```bash
useradd -g <groupname> -s /bin/bash -c "<some info about user>" -m -d <custom path for home dir> newuser
```

✅ -g will assign user to a group
✅ -s will set the default shell to bash
✅ -c it's always helpful to write some information while creating user
✅ -m creates home directory for the user
✅ -d specifz custom location for home directory

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/newusrdt.png)

> *🔎 `-g` with group name will assign user to that group. if we dont use `-g` flag, it will create and assign new group with same name as newuser. Also, this flag will assign the given group as a default group for that user.*

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/gnewusr.png)

> *🔷 Info: `-G` flag will assign user to secondary groups.So, The user can be part of other groups also.*

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/Gnewuser.png)


### 🧑‍💻 When a User is Created:
* By default, a group is automatically created with same name as user, this called Private user group model.
### 🔄 But what if:
* I want user to be part of existing group?, I can't delete the user and re-create the user evrytime; it's waste of time and not good practice also.
* I want user to be part of multiple group after user is created?
### ➡️ Enters `usermod`

## 🪚Modifying Users
To assign user in another group I useed `usermod -G`
```bash
usermod -G <grpname> <user_name>
```
![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/modusr.png)

> *⚠️ When I tried to assign another group named 'peter' it replaces the secondary group 'vraj'.*

If I want to keep the other secondary group with another secondary group i need to use `-a`(append) flag along with `-G` which is `-aG`.
```bash
usermod -G peter vraj
usermod -aG vraj vraj
```

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/modusr2.png)

**As we can see:**
* the default(primary) group for vraj user is bhavsar.

**What if:**
* I want to change the default group to vraj?

```bash
usermod -g vraj vraj
```
![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/modusr3.png)

### ⏩ Other usermod options:
✅ `-m -d`:  /jome/newfolder (I can move the users home directory to new location.)

✅ `-s`: I can modify users default shell type also, instead of bash I can modify it to `fish` or `zsh`

✅ `-L` / `-U`: I can lock or unlock user as root user.

✅ `-p` : I can change the password of the user.

```bash
usermod -m -d /home/VRaj Raj
```

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/mdmodusr.png)

![📖 Continue Reading...](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/Readme2.md)
