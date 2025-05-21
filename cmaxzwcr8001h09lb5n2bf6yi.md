---
title: "📈From Zero to DevOps: Week 4 – Building a Strong Foundation in Linux Networking- DHCP Working(DORA Process)"
datePublished: Wed May 21 2025 13:43:45 GMT+0000 (Coordinated Universal Time)
cuid: cmaxzwcr8001h09lb5n2bf6yi
slug: from-zero-to-devops-week-4-building-a-strong-foundation-in-linux-networking-dhcp-workingdora-process

---

In my previous blog, I documented how DNS works behind the scenes to resolve domain names into IP addresses.
This blog dives into another essential part of networking — **DHCP (Dynamic Host Configuration Protocol)** and its DORA process, which explains how devices automatically get an IP address when they connect to a network. If you’ve ever wondered how your laptop connects to Wi-Fi and just “knows” what IP to use — this blog will clear that up in a simple, story-like way.

## Dynamic Host Configuration protocol(DHCP)

**Dynamic Host Configuration Protocol (DHCP)** is a network protocol used by a DHCP server to automatically assign IP addresses and other network settings to devices when they connect to the network.

### The DORA process

When a device, like your laptop or smartphone, connects to a network for the first time, it doesn’t magically know what IP address to use. This is where DHCP (Dynamic Host Configuration Protocol) steps in — it's the friendly neighborhood service that assigns IP addresses to devices on a network. And this magic happens through a four-step conversation called **the DORA process — Discover, Offer, Request, and Acknowledge.**

Imagine your device is a new guest at a party and doesn’t know where to sit. It starts by shouting out loud: *“Hey! Is there anyone who can give me a place (IP address) to sit?”* — this is the DHCP Discover message. It's broadcasted across the network so that any DHCP server available can hear the request.

Now, the DHCP server hears the call and responds with an Offer. It's like someone at the party saying, *“Yes! I have a chair for you. Here’s a spot at Table 192.168.1.10, and you can sit here for the next 24 hours.”* This is the DHCP Offer message, where the server suggests an IP address and other configuration info like subnet mask, default gateway, and DNS servers.

The device receives this offer and replies, *“Hey, I like that seat. Can I please take it?”* — this is the DHCP Request. It’s the device’s way of confirming that it wants to use the offered IP address. Though there might be multiple offers from different DHCP servers, the device picks one and responds to that particular server.

Finally, the DHCP server responds with an Acknowledge message. It says, *“Great! That seat is officially yours. Welcome to the network.”* And just like that, the device is now part of the network, with its own IP address, ready to communicate.

This entire DORA process happens in just a **few milliseconds** every time a new device connects to a network. It ensures that devices don’t collide with each other’s IP addresses and makes the process **completely automatic**, saving us the trouble of manually setting network configurations.

The IP address assigned by the DHCP server **isn’t permanent** — it’s leased for a specific period known as the **lease time**. Once this time expires, the device may need to request a new IP address. Additionally, every time you disconnect and reconnect to a network, the DHCP server might assign you a different IP address, depending on availability and the server's configuration. This dynamic system ensures efficient IP management in busy networks.