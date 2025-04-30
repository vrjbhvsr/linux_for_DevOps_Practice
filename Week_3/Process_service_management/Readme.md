# Process Management 🔀

**In this section I will Explore:**

✅ Basic of processes

✅ Starting and Controlling Processes

✅ Signals and Process Termination

✅ Monitoring and Managing Resources

✅ Process Priorities and Scheduling

✅ Parent-Child Process Relationships

✅ Advanced Tools

✅ Process Automation & Logging

## Basic of Process 🌱

### What is Process?
* When we run any program or any command , it becomes a process. In other words, a process is a running instance of a program.
* To check the process in current terminal we simply write command `ps`.

```bash
ps
```

🖥️ Example Output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/ps.png)

**Here,**
* `PID` : Process ID
  
* `TTY`: Terminal (Teletypewriter) associated with the process, e.g., `pts/0`

* `TIME` : total CPU time the process has used

* `CMD` : Command name(what was run)


The command with flags shows the detailed information of process. 
> *For example*,
> **UID(UserID)** : Who is the owner of the process,
> **PPID(Parent process ID)**: The process started another process,
> **C**: CPU usage,
> **STIME**: start time,
> **TIME**: total time.

```bash
ps -ef
# or
ps -e -f
```

**Flags**

* `-e` shows all the processes not just in currrent terminal

* `-f ` shows full listed information.

🖥️ Example Output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/psef.png)

### Process States

All the process has it state, meaning whether the process is running, terminated, sleeping, or dead, and it is represented by single letter.

State | Description
------|-------------
R     | Runnning(on CPU)
S| Sleeping(Waiting for an event)
D| Uninterruptible sleep
T|Stopped
Z|Zombie(terminated but not reaped)
X| Dead (shouldn't be seen normally)

**There can be additional flags are appended on main state letter**

Flag  | Description
------|-------------
< | High prirority process
N| Less prority
L| process pages are locked into RAM.(No swaping of memory from RAM to Disk)
s| A session leader(Usually a shell or service)
l| Multi-threaded
+| In the foreground process group
I| Ideal kernel thread

**To check the process status we use `ps aux`.**
```bash

ps aux

```

🖥️ Example Output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/paux.png)


### Foregrouind vs Background Process
* Foground process: This process directly runs into terminal and it blocks the terminal or shell until it finishes the process.

  > For example, `top` command is used to see the process currently running(real-time), it is a foreground process.

* Background Process: This process runs in the background and don't block the terminal while being in the process. It ends silently unless we monitor.

  > The cron job that I set for backing up everyday at 3 am is background process.
```bash
# foreground process is any command we run in shell

top

# To make any process run in background we use

command &

```

### Daemon processes

* This processes are long-running background services. It does not have any controlling terminal.

  > The cron job is a daemon process.

```bash

# To see running daemons:

ps -ef |grep daemon

```

🖥️ Example Output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/dmn.png)


### Another usefull commands:

```bash
top                # Real-time view of processes
```

```bash
top                # Better Visual version of top
```

```bash
pidof                # Get PID o the programm
```

```bash
pgrep                # Searches processes by name
```
