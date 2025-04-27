[......Previous](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/User_and_filepermission/readme.md)

# User and File Permission in Linux🐧

## User Permissions🧑‍💻

In previous file I have learned about how to change the file permissions, how different user can access another user's files and directory. In a multi-user environment, different users need to perform operations to the same file. Also, it is necessary to remove users after particular task solved in that file. 

### 📚 In a multi-user environment:
* Different users often need access to the same file or directory.

* Simply changing permissions (chmod) can allow others to read, write, or execute.

* But sometimes, we need to give ownership of a file or directory to another user or group temporarily or permanently.

* Ownership determines who has full control over the file (beyond just permissions).


### 🛠 Why change ownership?
* When a new user is responsible for a project/file.

* When multiple users work together on a file (then you usually set a group ownership).

** After the task is completed, ownership can be changed back or the user can be removed from the group.

```bash
chown ubuntu new_file.txt
```

> This command will give you permission denided because changing an ownership of file requires root access, so we need to use `sudo` command.

```bash
sudo chown ubuntu new_file.txt
```

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/chown.png)

**same way we can change the group also with `chgrp` command.**

```bash
sudo chgrp developers new_file.txt
```

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/chgrp.png)


## Access Control List in Linux

This is very useful way to provide permssion to the users. 
* When we we change file permission to file it applies to all users or group but what if we want to give permission to specific user only.

* Also, when we change the ownership of the file we provide to full access of that file to that user. For saving files from that we can use Access control commands.

**To check the file information such as owner and permissions:**

```bash
sudo apt install acl

getfacl new_file.txt
```

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/getfacl.png)


**For adding permission for user:**

```bash
setfacl -m u:username:rwx new_file.txt
```

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/setfacl.png)

**For removing specific user and permission:**

```bash
setfacl -x u:username:rwx new_file.txt
```
![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/setx.png)
**For removing all the Entires**

```bash
setfacl -b new_file.txt
```


**For adding permission for group:**

```bash
setfacl -m g:groupname:rwx new_file.txt
```

![image](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_2/screenshots/setfaclgrp.png)
