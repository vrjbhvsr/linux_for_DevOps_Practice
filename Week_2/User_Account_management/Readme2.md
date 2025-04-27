# 🐧 Linux User Account Management 🔐
[...previous⬅️](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/User_Account_management/Readme.md)

## 🔑Set Password for user
So far, I have created multiple users but didn't set password. 
**To create password for any user I need to:**

```bash
passwd <username>
```
It will ask me to enter new password for given user and retype it for confirmation.

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/psswd.png)

**Now, let's switch from the root user to vraj user**

```bash
su - vraj
```
> **ℹ️ : When i switched from root user to vraj user it didn't ask me password because root user can switch to anz user without permission. when i switched from vraj to root user it asked me the own password(vraj's password).**
> 
> **Same way if i want to switch from vraj to peter i need to provide password for peter if peter's password is set. if peter's password is not set it will still ask the password and will throw the error authenticatio failiur.**

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/psswd2.png)

I faced one situation where i switched from root user to peter and when i tried to switch back to root user, it asked me to type password for peter eben though i have not set it yet. I came out of it by doing following:

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/psswd3.png)

> **Even though peter is in the sudo group, you still need to authenticate. That means a password must be set for peter in order to use sudo privilage.**
> 
> *🧠Even if a user has sudo privileges, Linux still requires password authentication unless passwordless sudo is explicitly configured (not recommended for security reasons).*

**👁️To viewing the list of all users on your system and some important info about each:**
> * How many users have been created?
> * Where is the user located?
> * What is unique id, group id for the user.

```bash
less /etc/passwd
```

## 👨‍👨‍👧‍👦Create and delete group

**It is very simple to create a group. I can create a group in similar way as creating a user.**
```bash
groupadd developer
groupadd operations
groupdel operations                                # to delete group
```
> **To see the details of group:**
> * which group is created last?
> * Which group has what id ?
> * Basically all the group related info can be found in group dir from root dir.

```bash
less /etc/group
```

![script output](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/grp.png)

## Deleting Users
This task is also simple. I simply write:

```bash
userdel vraj      # This will deletes the user account but keeps the home directory and files.
userdel -r vraj   # This will deletes the user along with their home directory and mail spool.
userdel -f vraj   # This will force delete the user even if it's logged in or running a process.
```
[Continue......](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/Linux_File_system/Readme.md)
