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
htop                # Better Visual version of top
```

```bash
pidof                # Get PID o the programm
```

```bash
pgrep                # Searches processes by name
```



## Starting and Controlling Process

### Running Programs

* To run a compiled program or script in the foreground:
  
▶️ Basic Run:

```bash
./program-script
```

* To run a compiled program or script in the Background:

▶️ Background Run:

```bash
./program-script &
```

### Controlling Foreground and Background jobs

📌 `jobs`: Shows the background jobs for current terminal.

```bash
jobs
```

📌 `fg`: Bring background job to the foreground

```bash
fg %10      # Here, % is show it's a job number not processID
```

📌 `bg`: Resumes a suspended job in the background.

```bash
bg %10
```

### Suspending job

📌 `ctrl + z`

* The job we want to stop or suspend can be done by  `ctrl+z` command. When we again want to continue we just have to write `bg`
or `fg`.

 ### 🛡️ Run Programs That Survive Logout

If we want to logout and process is running background we can still do it without terminating the process by `nohup` command. The process continues even after log out and saved to `nohup.out` once finished.

 ```bash
nohup ./program &
```

📌 `disown`

If we use disown the job than it will be removed from the jobs table. The shell will forget this job and won't keep track of that job. When you log out it might get killed.

```bash
disown %10
```

So, After disowning the job shell forgets the job id and we won;t be able to conitnue job later. it's gone completely. But we might able to get the process Id using `pgrep`, `top`, `pidof`.



## Signals and Process Termination

### What is signal?
* Signal is a way for the OS or user to communicate with the process. Signals are used to pause, terminste, stop ot interupt the process.

signal | number| meaning
-------|-------|--------
SIGTERM | 15 | To terminate the process
SIGKILL | 9 |Force kill
SIGSTOP| 19| To pause the process as ctrl+z
SIGCONT| 18| To continue the paused process
SIGHUP|1 |Terminal hang-up, or to logout
SIGINT| 2| Interrupt same as ctrl+C

**To send this signal to process we can use kill command along with signal name or number.**

``` bash
kill -signal PID

# or

Kill signalnumber PID
```


🖥️ Example Input:

``` bash

kill -9 1234        # Force kill (SIGKILL)
kill -15 1234       # Graceful terminate (SIGTERM)
kill -STOP 1234     # Pause process
kill -CONT 1234     # Resume process
```


### Zombie and Orphan processes

**Zombie Process:** Zombie process is a child process that has finished but the paraent process did not collect exit staus. This process stays in process tables.

**Orphan process:** Orphan process is a process where parent process is has died. In this case OS reassigns it to init/systemd to take care.

**Another usefull commands**

`kill PID`: sends signal(SIGTERM)

`kill -9 PID`: Force kill

`pkill name`: kills the process with process name

`killall name`: kills all the process with given name.

`xkill`: Click a window to kill its process


## Monitoring and managing Resources

### Real-time monitoring with `top` command

* To monitor real time process, we have already seen the command `top`. 

* It also gives information about CPU, load average, memory.

* After running top command, we can perform interactive command while running top process.

  * `P`: Sort the processes by CPU usage
 
  * `H`: To toggle the thread view
 
  * `M`: sorts the processes by memory usage
 
  * `k`: kill a process
 
  * `r`: renice the process(Changing the priority)
 
  * `u`: filter the process by user
 
### Enhanced inference with `htop`

* Using `htop` command we can have color coded, mouse support visualization.

* It shows tree view of Parent-child processes.

* Easier to sort, search with F6,F3 buttons.

> *We can also visualize sorted processes by CPU and memory usage using `ps` command.*

```bash
ps aux --sort=-%cpu
ps aux --sort=-%mem
```

Here, - sign shows sorted in descending order.


### ⚖ 3. nice and renice — Set or change process priority

We can prioritize the process on the scale of -20 to +19, where -20 is the highest priority and +19 is the lowest priority and when no value is provided then it sets to 0.

```bash
nice -n 10 myscript.sh
```

We can change the priority of running process using`renice`

```bash
renice -n 5 -p 1234
```

### vmstat - Virtual memory statistics

This commands shows the memory process, swap process, i/o process at set time. For example if we set 10, it will give us the status at every 10 seconds.

```bash
vmstat 10
```

🖥️ Example Output:

![screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_3/Screenshots/vmstate.png)


* r: run queue (how many processes waiting for CPU)

* free: free memory

* si/so: swap in/out

* us, sy: CPU time user/system


