---
title: "📑 Week 3 with Linux: Handling Files, Processes & Services the DevOps Way 🐧"
datePublished: Tue May 13 2025 08:33:24 GMT+0000 (Coordinated Universal Time)
cuid: cmam9rfeu003z09lag5tmgoa1
slug: week-3-with-linux-handling-files-processes-services-the-devops-way

---

Welcome back to my DevOps journey! This is my third week, and this week, I dived into some practical, engaging, and crucial Linux concepts, especially for DevOps Engineers. From bundling files and directories to understanding the workings of different services and processes, this week laid down the foundational knowledge that every DevOps professional should master.

> (Optional intro note)
Note: Life got a bit busy, so this blog is arriving a week later than planned—but the learning never stopped! Here's a full recap of what I explored during Week 3 of my Linux journey. 🚀

## 📖 What I Learned This Week

📦 Archiving, Compressing, and Backup

Understood what tar and gunzip commands are for archiving and compressing files. These commands are essential for transferring and backing up the data effectively.

🧠 Process Management

Learned what a process is, how to start, and control a process, Signal, and process termination. Understood parent, child, orphan, and zombie processes. 

⚙️ Service Management

Services (daemons) are background processes that keep critical functions running.
In this section, I explored what service is, systemd basics, systemctl command, ts functions and journalctl for logging.

✂️ Text Processing with awk
The awk command is super powerful for text processing and reporting. I practised filtering logs and extracting columns from the output. I'm still exploring more text processing tools like sed, which I plan to cover in next week's blog.

## 📂 GitHub Repository

Check out my GitHub repo for a detailed view of my learning. [🔗 Linux_for DevOps](https://github.com/vrjbhvsr/linux_for_DevOps_Practice.git)

## ✍️ Learning story

After completing my blog and LinkedIn post last week, I thought I’d dive right into the next set of topics the very next day. But luckily, I didn’t. Giving myself that short break helped me reset and start the week with better focus and energy.

###📦 Archiving, Compressing, and Backup

It took me a solid 4–5 hours to truly understand archiving, compression, and backup tasks. Surprisingly, getting familiar with the tar command and its operations was quite smooth. Learning about flags like `-c` for creating a bundle and `-x` for extracting it made me feel like the most intelligent person on earth for a moment—until I realized that was just a little delusion I was living in 😄 (jokes apart!).

One real challenge I faced was when I tried to create an incremental backup. That part wasn’t as straightforward and pushed me to dig deeper into how tar handles snapshots and timestamps.

When learning about backup, I created an archive and compressed it. I have also used the `-v` verbose flag at first, and it gives me a long list of files and that are being archived. I was wondering there are only few files are there why it's showing so many files? 

As I walked through the output carefully, I realized it was because of the hidden .git folder inside my directory. Since .git contains many internal files and subdirectories, it ended up being included in the backup too.

That’s when I discovered the --exclude= flag in tar. Using this, I was able to exclude the .git folder from the archive, keeping my backup clean and lightweight.

```
tar --exclude='*.git' --exclude='.webp' -czvf ubuntubackup.tar.gz /home/ubuntu
```

Incremental backup was another interesting part of the backup process. At first, I assumed that we could create an initial backup with the same `tar` command above, but that was not the case. 

We have to create an incremental backup with `--listed-incremental=`. This requires creating a tracking file, which can be `snapshot.snar`, and using the same file for the next backup.

```bash
# ✅ Step 1: Create the full backup (with snapshot tracking)
tar --listed-incremental=snapshot.snar -czvf full_backup.tar.gz /home/vraj

# ✅ Step 2: Later, create the incremental backup (with same snapshot file)
tar --listed-incremental=snapshot.snar -czvf incremental-backup.tar.gz /home/vraj
```

This process is beneficial when you want to save space and time by backing up only the files that have changed.

A deeper level of understanding clicked into place here, realising how efficient backups can be when done right.

**Cron Jobs**

This topic was extremely easy-at least from what I have understood so far. To schedule a task, we use:

```
crontab -e
``` 

This opens the cron job editor, where we can add commands using cron syntax to automate tasks at specific times or intervals.

```
0 3 * * * sudo tar --listed-incremental=snapshot.snar -czvf /home/vraj/$(date +\%F)-backup.tar.gz /home/ubuntu
```

###🧠 Process Management

This part of the week took me 2–3 days to understand properly, but it was totally worth it. I decided to go in-depth with process-related concepts, which are crucial for system monitoring and debugging.

I started with the ps command and explored its various flags like ps aux, ps -ef, and what each column in the output actually means—PID, TTY, TIME, CMD, etc.

From there, I moved on to understanding different process states such as:

`R` – Running

`S` – Sleeping

`T` – Stopped

`Z` – Zombie

`D` – Uninterruptible sleep

I also learned that additional flags or symbols can be appended to these states to provide further insights into process behaviour (like <, N, L).

This topic was a bit heavy at first, but taking the time to explore it deeply gave me a much better grip on how Linux manages running applications.

Next, I explored **foreground and background processes**. I learned how to:

* Use fg to bring a process to the foreground

* Use bg to resume a process in the background

Run commands directly in the background using `command &`

Then came **daemon processes**—these are long-running background processes that typically start at boot time and don't interact directly with the user (like system services).

To work more effectively with processes, I also learned how to use:

* pidof – to find the process ID of a specific running program

* pgrep – to search for processes by name or other attributes

Understanding these tools gave me more control and visibility over what's running on my system.

It was a mixture of theory and hands-on commands throughout this topic. But honestly, once I understood the theory behind how Linux handles processes, all the commands started making sense and clicked together nicely.

Everything was going smoothly... until I hit the wall with **nohup** and **disown**. These two threw me off at first.

* `nohup` is used to run a command immune to hangups, meaning it keeps running even if you log out of the terminal.

* `disown` removes a job from the shell’s job table so that it won’t be sent a SIGHUP signal.

It took some experimenting (and a few "why isn't this working?" moments 😅) to wrap my head around these, especially how they behave differently when combined with background processes and terminal sessions.

But in the end, understanding these helped me appreciate how powerful and flexible Linux process management really is.

**Process Priorities & Scheduling**
This part of Linux was like opening a whole new chapter. As soon as I heard *“we can change process priorities from user space,” my brain went: Wait... can we really influence how the CPU schedules things? 😯*

I started with nice and renice, and while they seemed simple at first, I couldn't help but ask:

*“If I’m just a user, how am I deciding what the CPU should prioritize?”
“Is the kernel really listening to my commands?”*

Turns out—yes and no. We’re only making a request. The actual scheduling still happens in kernel space, and we’re just nudging it politely.

Then came the big topic: **CPU Scheduling**.

*“How does Linux even choose what to run next?”
“Why doesn’t one heavy process block everything else?”*

Enter the CFS (Completely Fair Scheduler)—a beautifully balanced mechanism that uses weights from nice values to give everyone a fair share of CPU time. It made me appreciate how Linux handles both my casual script and a resource-hungry service without crashing.

Then I met the real-time scheduling policies: `SCHED_FIFO` and `SCHED_RR`. That’s when things got serious.

*“So, a high-priority real-time process can literally block others?”
“What if I accidentally lock out important services?” 😨*

Learning `chrt`, how **SCHED_FIFO** just runs until it’s done (rude but efficient 😅), and how **SCHED_RR** slices time to share among processes—it all made sense when I thought about critical systems like robotics or media players.

And just when I thought I was done, I stumbled into the world of parent-child processes. I always saw them in ps output but never knew how they were actually created.

*“What’s this mysterious `fork()` I keep hearing about?”
“And why does everyone pair it with `exec()`?”*

I finally understood it:

* `fork()` duplicates the current process.

* `exec()` replaces it with a new one.

It’s like cloning yourself, and then your clone decides to go become something else entirely.

This section was filled with **"aha!" moments** and just as many **"wait, what?"** questions. But that’s what made it so memorable. Linux doesn’t just run stuff—it orchestrates a smart, layered system of priorities and fairness, and I feel like I finally got a peek behind the curtain.

**⚙️ Service Management**
This part of my Linux journey felt like stepping behind the scenes of a live show—where services were the backstage crew making everything work smoothly.

At first, I kept seeing strange names ending with “d” like sshd, cron, and mysqld, and I wondered what all of them were doing quietly in the background. Once I realized these were daemons—background programs that manage system-level tasks—it all clicked! I started seeing my Linux machine like a team of silent workers, each focused on a job.

Then came **systemd**. I had heard that it’s the first process that boots up your system, but when I found that PID 1 is always systemd, something about it felt profound—like meeting the captain of a ship. Digging deeper into units, I was fascinated by how everything was structured so logically: `.service` files to manage services, `.socket` files to wait for requests, `.target` to group services—it was like Linux had its own smart task manager.

🧠 I especially loved the idea of `.socket` units starting `.service` units only when needed—like on-demand employees showing up just in time for their tasks.

Then I met `systemctl`. It became my remote control for all services. Whether I wanted to start, stop, restart, or even enable a service to run on every boot, systemctl was there. And when I made a mistake? No worries—`systemctl status <service>` helped me debug it.

One of the coolest parts was learning how to track logs with journalctl. At first, logs felt overwhelming—like endless streams of tech gibberish—but using flags like `-u`, `-b`, or even `--since` `"1 hour ago"` helped me filter and understand exactly what happened and when.

By the end of this section, I felt like I had unlocked the admin dashboard of Linux. Now I could control what runs, when it runs, and how it behaves—even troubleshoot when things go wrong.


## 📚 Resources I Used
Learning Linux the DevOps way can be intense, but these resources made it much more approachable and enjoyable:

🎥 YouTube Channels

[Abishek Veermala](https://www.youtube.com/watch?v=29eDuMjsEF8&t=0s),[Shubham Londhe](https://www.youtube.com/watch?v=SJTJVb5w45E&t=0s), [M Prashant](https://www.youtube.com/watch?v=kmk3_kEiJvk&t=0s)

🤖 ChatGPT
Whenever I had doubts, needed real-world analogies, or just wanted to understand the “why” behind a command or concept, ChatGPT was my go-to support system. It didn’t just give me answers—it helped me build clarity, reinforce my understanding, and apply concepts more effectively in real scenarios.

Also, while writing this blog, it helped me refine my thoughts and structure my words—making it easier to share my journey in a clearer and more engaging way.

## 🚀 Wrapping Up Week 3 – Ready for What’s Next?
This week was a deep dive into the inner workings of Linux—from backing up data smartly, understanding process scheduling, to mastering service management like a pro. Every topic helped me see Linux not just as an OS, but as a finely tuned system where every process, priority, and service has its own rhythm and reason.

If you've been following along and exploring these concepts with me, you’ve already taken a big leap toward becoming comfortable with system-level operations—something that once felt intimidating.

But we’re not stopping here.

In Week 4, we’re stepping into the world of networking and security—how Linux connects, communicates, and protects itself. From firewalls to SSH hardening, from managing ports to monitoring network traffic… it's going to be packed with real-world, hands-on skills.

Stay tuned—Week 4 is where we start thinking like system administrators and security-minded professionals.

Thanks for reading!
