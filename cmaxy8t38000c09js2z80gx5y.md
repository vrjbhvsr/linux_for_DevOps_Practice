---
title: "📈From Zero to DevOps: Week 4 – Building a Strong Foundation in Linux Networking- DNS Working"
datePublished: Wed May 21 2025 11:00:18 GMT+0000 (Coordinated Universal Time)
cuid: cmaxy8t38000c09js2z80gx5y
slug: from-zero-to-devops-week-4-building-a-strong-foundation-in-linux-networking-dns-working

---

In my previous blog, I covered the basics of IP addressing. After that, I explored concepts like subnetting and CIDR, which I've documented in more detail on my GitHub repository. While I’ve also written about DNS in the repo, this blog is focused on understanding how DNS works behind the scenes — not just what it does, but how it actually does it. Think of this as a step-by-step story to demystify what happens when you type a website name into your browser.

## 🌐 Domain Name Service (DNS)

DNS (Domain Name Service) is a distributed database that maps human-friendly domain names (like google.com) to IP addresses (like 142.250.195.206).

Well, that’s the textbook definition — but in this blog, let’s go beyond that. I’ll break it down in a simple, story-like way so we truly understand how DNS works behind the scenes when you type a website into your browser.

### 🌐 Behind the Scenes: How DNS Works?

While learning about IP addresses, one common example kept coming up: *Suppose you want to access google.com, but your computer doesn’t actually “know” what that is—it only understands IP addresses.* That naturally raised a big question in my mind: How does the system find the IP address for a domain name like google.com?

After all, we don’t type in IP addresses when we browse the web—we just write names. So how does the computer figure out which IP address belongs to the website we’re trying to reach?

**Enters DNS**

When I first heard about DNS, someone told me, "It's like the phonebook of the internet." That sounded simple, but I wanted to know what really happens behind the scenes when I type something like www.google.com in the browser. So, here's how I understood DNS — step by step, as a small story.

Let’s imagine you’re sending a letter, but instead of using a house address, you only know the name of the person. You’ll obviously need someone or something to find the correct address for you. That someone is the DNS (Domain Name System).

**Step 1: Typing the Website**

It all starts when you open a browser and type a website name, let's say `google.com`. As we know, the computer doesn't understand that name directly-it needs IP address (something like 142.250.182.36) to connect and get the website. That's where DNS comes in.

**Step 2: The Local Cache**

Before your computer reaches out to the internet asking, “What is the IP address of this domain?”, it first checks its DNS cache. This cache stores IP addresses of websites you've recently visited. If the IP for the requested domain is already stored there, your system uses it instantly—making the process faster and saving time.

But if you're visiting a website for the first time, or the IP address is no longer in the cache, your system begins the actual DNS resolution journey.

**Step 3: Asking the Recursive Resolver**

Now, A recursive DNS resolver (like the one your ISP or Google provides) is the middleman between you and the actual DNS servers. Its job is to find the IP address for a domain name (like openai.com), and return it to you.

* It first performs step 2, checking the DNS cache.

* If Not in Cache → Starts the Journey 🚶
    If the answer isn't cached, the resolver acts on your behalf as it knows where to ask for it.

**Step 4: Root Name servers**

At this stage, the DNS resolver reaches out to the Root Name Servers to find the IP address.

*Resolver: "Hey, Root Server, I need the IP address for google.com."*

*Root Name Server: "I don’t know the exact IP, but I can tell you who manages the .com domains — you should ask the `.com` Top-Level Domain (TLD) servers."*

**Step 5: TLDs server(Top Level Domain server)**

Here, Resolver contacts the Top-Level domain name server for `.com` These servers manage everything that ends in `.com`.


*Resolver: "Hey, TLD Server, I need the IP address for google.com Root name server asked me to ask you."*

*TLD Server: "I still don’t know the full IP address of www.google.com, but I know who manages it. Try the authoritative name server.*

**Step 6: Authoritative Name Server**

Finally, the resolver reaches the authoritative name server, which has the actual IP address of www.google.com.

This server replies with the final answer: "Yes! www.google.com lives at 142.250.182.36."

**Step 7: Sending the Response back**

Now that the resolver has the IP, it sends it back to your computer. Your browser takes that IP address and starts communicating with Google’s web server to load the website.

Your system also stores the IP in its cache, so that if you visit google.com again soon, it won’t repeat the whole process.


And That’s How DNS Works!
All of this — from typing the website to loading the page — happens in just a few milliseconds. It feels like magic, but now you know the journey your request takes. DNS is like a smart guidebook that helps computers talk to each other using names instead of confusing numbers.

Please feel free to ask questions in the comment section.

Thanks for reading!
@vrj_bhvsr