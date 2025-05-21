---
title: "📈From Zero to DevOps: Week 4 – Building a Strong Foundation in Linux Networking- IP Addressing"
datePublished: Wed May 21 2025 09:06:44 GMT+0000 (Coordinated Universal Time)
cuid: cmaxy81x1000a09js3tihb6e3
slug: from-zero-to-devops-week-4-building-a-strong-foundation-in-linux-networking-ip-addressing

---

Welcome to Week 4 of my learning journey! This week, I’ve taken a different approach — rather than rushing through topics, I’ve decided to slow down and truly understand the core concepts of networking with clarity and calm.

Networking can seem overwhelming at first, so I’m focusing on getting the fundamentals crystal clear. As I explore deeper areas, I’ll be documenting the concepts that need extra attention — and sharing them here in blog series format.

In this part-wise series, you can expect topics like:

📡 IP Addressing

🌐 How DNS Works

🔁 TCP Basics and Communication Flow
… and more!

I hope you find these insights helpful and interesting as I continue this journey. Let’s get started with the basics — one concept at a time.

#✍️ Learning story

I was already a week late in starting the networking module, and there was a lot to catch up on. So I began by researching where to start—and quickly realized that IP addressing is the foundation of networking. That’s where my journey began.

To my surprise, IP addressing was relatively easy to understand. I learned about its versions, how it’s structured, and most importantly, why it’s needed. Along the way, I encountered a bunch of new terms I hadn’t heard before. Curious by nature, I started digging into every unfamiliar concept until things started making sense.

I approached the topic by asking three key questions:
**What is IP addressing? Why do we need it? And how does it work?**
The definition was pretty straightforward—just what the name suggests. But what helped me truly understand it was a simple real-world example:

> If I were working as a delivery person, I would need the correct address to deliver a package. In networking, the IP address is that “delivery address” where we send or receive data packets.

That analogy helped solidify the concept in my mind—and from there, the rest of networking started to click into place.

When I was learning about IPv4 and IPv6, a question came to my mind:
Does an IP address stay the same, or does it change over time?

That’s when I discovered that there are actually **two types of IP addresses**:

1. Dynamic IP Address

2. Static IP Address

I learned that **dynamic IPs** are assigned by the network automatically and can change frequently—like each time you reconnect to Wi-Fi or restart your router. So, in most cases, the IP address is not permanent.

On the other hand, a **static IP address** remains the same every time, unless it is manually changed. For example, a web server usually uses a static IP so that it can be reliably reached by users across the internet.

While exploring further, I also came across private IPs and public IPs:

The host portion of an IP address within a local network is called a private IP. This is what your router or local devices see.

A public IP address is what the internet sees, and it is assigned to your network by your Internet Service Provider (ISP).

Understanding these concepts helped me grasp how communication works between devices on a local network and across the internet.

While learning about how devices communicate over networks, I also came across a few new terms like **NAT (Network Address Translation)** and **DHCP (Dynamic Host Configuration Protocol)**. These concepts helped me understand how a private IP is translated to a public IP when sending or receiving data over the internet.

However, I realized that these topics dive a bit deeper into the workings of networking. So, I’ve decided to cover them in a separate section or future post.

Later, I began to understand how these IP addresses are structured. **IPv4 was pretty easy** to grasp—simple numbers separated by dots.

**IPv6 was also understandable**, but it introduced some new concepts that I hadn’t seen before. One interesting thing I learned was that IPv6 addresses can be **shortened** to make them more readable:

* You can remove leading zeros in each group.

* You can also collapse consecutive blocks of zeros using a double colon ::, but only once in an address.

>✅ Example:
>Full IPv6: 2001:0db8:0000:0000:0000:0000:1428:57ab
>Shortened: 2001:db8::1428:57ab

These little tricks helped me see that IPv6, though longer, is actually designed to be efficient and flexible.

Afterward, I came across something quite surprising—in IPv6, the Interface ID (which is like the host portion of the address) is often automatically generated from the device’s MAC address. This is done using a process called **EUI-64 (Extended Unique Identifier)**.

I found it interesting (and a bit unexpected!) that the hardware address of a device plays a role in forming its IP address. It made me realize how smart and automated networking protocols are becoming.

But I decided not to go too deep into this topic for now—I’m guessing it will come up again in later chapters 😄. So I’m parking it here as a “to-explore-later” concept.


📝 Note: I’ve documented more detailed insights on IP Addressing in my [GitHub repository](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Readme.md#1-ip-adressing). Feel free to check it out — it’s written in a beginner-friendly way, based on my own understanding and learning experience.

For now, I think this much information gives a solid foundation to understand IP addressing—what it is, why it matters, and how it works.

Thank you for reading!
@vrj_bhvsr

