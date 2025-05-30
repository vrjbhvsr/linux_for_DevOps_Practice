# Service management

**In this section I will explore:**
1. Understanding Linux Services
2. Systemd Basics
3. Service Management using systemctl
4. Logs with journalctl 

## 1. Understanding Linux Services

* A service in linux is a program that continuously runs in the backgorund to handle specific tasks or requests. These are also called daemons.

* We often see the services in linux that ends with `d`(daemons).

**Common linux services:**

`sshd`: Handles Secure Shell(SSH) remote connections

`nginx`: used as Web server, reverse proxy/load balancer

`apache2` or `httpd`: used as web server

`mysqld`: MySQL database server

`cron`: Schedular for periodic tasks

`networking`: Handles networking setup

`ufw/ firewalld`: Handles firewall services

`docker`: used for container engine to run containers


## 2. Systemd Basics

* systemd is the init system or service manager used in most modern linux distributions. It is the main program that starts when we boot the system.

* When we check the processes that are running te PID = 1 will be always the systemd. This process is started by the kernel.

* There are few things to take into consideration:
 **Units:**
   * Everything in systemd is a unit. Everything that is managed in systemd is unit. Every file in systemd is unit that tells it how to manage something.
  
   * This files(units) types in systemd are:
     ✅ `.service`: Defines a background service (daemon). This unit keeps information about services. which service to run? when to run? is this service requires another service to run?

     ✅ `.socket`: It waits for connection request coming from TCP port or unix socket. When it finds connection then it connects with .service file for that service. 
     > 🧠 Example: docker.socket listens on a Unix socket and starts docker.service only when needed.
     
     ✅ `.target`:  This unit is created for grouping multiple services. When we want to run one srvice and that service requires another services also, target file group that services.
     > 🧠 Example: multi-user.target = networking + login + system services (no GUI).
     
     ✅ `.mount`: This unit is used to automatically mount thte system. It tells systemd where to mount the drive, when to mount it?
     > 🧠 Example: You want to mount a network folder (NFS or SMB) every time the system boots — use a .mount unit.
     
     ✅ `.timer`: This unit tells systemd when to run a `.service` file.
     > 🧠 Example: As i set cron job to run at 3AM.
     
**Dependencies:**
 * In systemd, dependencies define how and when one unit depends on another.
     * You want to start Service A, but it relies on Service B to be running first.
       
  That’s where Requires=, Wants=, After=, and Before= come in.


## 3. Service Management using systemctl

✅ Show all active services

```bash
systemctl list-units --types=services
```

✅ Show all .service unit files

```bash
systemctl list-unit-files --type=service
```
✅ To serch specific service

```bash
systemctl list-units --type=serivce |grep ssh
```

✅ View detail information about specific service if it's active or not

```bash
systemctl status ssh
```

✅ To start a service

```bash
systemctl start <service>
```

✅ To stop service

```bash
systemctl stop <service>
```

✅ To Restart service

```bash
systemctl restart <service>
```

✅ To Auto-start service on boot

```bash
systemctl enable <service>
```

✅ To Prevent service from starting on boot

```bash
systemctl disable <service>
```

✅ Check if it's enabled at boot

```bash
systemctl is-enabled <service>
```

## 4. Logs with `journalctl` 

* `journalctl`  is used in systemd based systems as logging tool.
* To view various logs:

✅ To view all logs

```bash
journalctl
```

✅ To view logs for specific service

```bash
journalctl -u ssh.service
```
> `-u` flag shows unit

✅To view logs from current boot

```bash
journalctl -b
```
> `-b` flag shows boot

✅ To view logs from past hour

```bash
journalctl --since "1 hour ago"
```

