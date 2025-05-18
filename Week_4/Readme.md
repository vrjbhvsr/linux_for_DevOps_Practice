# Networking in Linux

1. Fundamentals: Understanding core concepts and CLI basic
   * IP Addressing
   * Subnetting, CIDR, and default gateways
   * DNS,DHCP,NAT
   * Ports, TCP vs UDP, ICMP(ping, traceroute)
   * OSI Model
  
# Networking Fundamentals

## 1. IP Adressing

### What is IP address?

Ip adress is a **unique identifier** assigned to **every devie** connected to a **network**. It is short for Interent Protocol Address. The data on the internet with the help of ip address can know where to go such as to computers, a server, a website.

### Why do we need IP Address?

The primary reason we need an IP (Internet Protocol) address is to make the internet—and any network—function correctly.

Imagine a scenario where three people are connected to the same network and want to send data to each other. How does the system know who is sending the data and who is supposed to receive it? Just like sending a physical letter requires the sender's and receiver's addresses, data transfer over a network requires both the sender's and the receiver's IP addresses.

This is where IP addresses come into play—they uniquely identify devices on a network, ensuring that data is delivered to the correct destination.

### What are the types of IP Address?

* There are two main version of IP address used to identify devices on a network.
  * `IPv4`
  * `IPv6`

✅ **IPv4 (Internet Protocol version 4)**
IPv4 is the fourth version of the Internet Protocol and is the most widely used protocol in the world today, especially in home and business networks.

* An IPv4 address is written in the format: x.x.x.x, where each x is an octet ranging from 0 to 255.

* Each octet is 8 bits, so the full IPv4 address is 32 bits in total (4 bytes).

* Example addresses: `0.0.0.0`, `192.168.1.1`, `255.255.255.255`.

* IPv4 supports over 4.3 billion unique addresses (2^32), though not all are usable due to reserved ranges.

Despite its limitations in address space, IPv4 remains dominant due to its simplicity and widespread compatibility.


✅ **IPv6 (Internet Protocol version 6)**
IPv6 is the most recent version of the Internet Protocol, designed to overcome the limitations of IPv4—especially the shortage of available IP addresses.

* An IPv6 address consists of 8 groups of hexadecimal numbers, separated by colons (:).

* Each group can contain digits from 0–9 and letters from A–F.

* Example address: 2001:0db8:85a3:0000:0000:8a2e:0370:7334

* Each group is 16 bits, making the full IPv6 address 128 bits (16 bytes).

* IPv6 allows for approximately 3.4×10³⁸ unique addresses, making it highly scalable for the future of the internet.

With the growing number of devices connecting to the internet, more organizations are adopting IPv6 to ensure long-term network growth and sustainability.

### How is IP addressing structured?

✅ **IPv4**

IPv4 structure is divided into two parts.
  1. **Network Portion(Identifies the network)**
     The first three group of the address that is separeted by the decimal point identifies the network. This portion is used to determine if the incoming data belongs to the same network that originally made the request.
  2. **Host portion(Idenifies the device)**
     Last part of the group (The Octet) identifies the device within the identified network. It tells the network which exact device made the request or should receive the data.

> 🔍 Example: In the IPv4 address 192.168.1.10
>   * 192.168.1 is the network portion
>   * 10 is the host portion

⚠️ Note: The division between network and host portions can vary based on the subnet mask used (e.g., Class A, B, C or CIDR notation).

✅ **IPv6**

* As I mentioned above IPv6 addressis divided into 8 blocks.

* Example address: 2001:0db8:85a3:0000:0000:8a2e:0370:7334

  1. **Global Routing Prefix**: First two block of the address is GRP(Global Routing Prefix). In the above example `2001:0db8` is the GRP which identifies the larger network or internet service provider(ISP).
  2. **Subnet ID**: The next block after GRP is subnet ID. The subnet stands for sub-network meaning the one large network is divided into various subnets that help in IP address management and security.
  3. **Interface ID**: The rest of the blocks are the interface id that identifis the specific device on that subnet. This is simillar as the IPv4 host portions and changes per device.
    
🧠 **Simplified Breakdown**
 ```text
[ Global Prefix ][ Subnet ID ][ Interface ID ]
       48 bits     16 bits        64 bits
```

> *The last 64 bits are often based on the device's MAC address (EUI-64 format), but can also be randomly generated for privacy.*


### 🔷 IP Address Classes (for IPv4)

| Class | Range                       | Example     | Purpose         |
| ----- | --------------------------- | ----------- | --------------- |
| A     | 1.0.0.0 – 126.0.0.0         | 10.0.0.1    | Large networks  |
| B     | 128.0.0.0 – 191.255.0.0     | 172.16.0.1  | Medium networks |
| C     | 192.0.0.0 – 223.255.255.0   | 192.168.1.1 | Small networks  |
| D     | 224.0.0.0 – 239.255.255.255 | –           | Multicast       |
| E     | 240.0.0.0 – 255.255.255.255 | –           | Experimental    |

**✅ Private IP ranges (used in LANs):**

10.0.0.0 – 10.255.255.255

172.16.0.0 – 172.31.255.255

192.168.0.0 – 192.168.255.255

### 🔷 IP Addressing in Linux

```bash
ip a
```
The commnad above is used to check the IP address in linux.

**🔍Example output**

[SCreenshot]()

## 2. Subnetting, CIDR, and default gateways



### 🌐 Subnetting(Subnet)

Subnetting is the process of dividing a larger network into smaller, logical subnetworks (or subnets). This practice is especially useful in large organizations with many users and devices connected to the same network.

**Why do we need Subnetting?**

* **Improved security:** By isolating subnets, we can limit the blast radius of any malicious activity- infected devices in one subnet won't directly spread more problems.
* **Better performance**: Smaller broadcast domains reduce network congestion and improve overall throughput.
* **Simplified Management:** You can assign IP ranges to different departments or functions, making it easir to monitor or troubleshoot, and apply policies.
  > We can identify where a device lives just by its IP.
  > * 10.0.1.x = HR network
  > * 10.0.2.x = Guest Wi-Fi
* **IP address Conservation:** If you need on;y 30 hosts, use a /27 (32 addresses) instead of wasting a full /24.
    * CIDR lets you right‑size each network to the number of hosts you actually have.
* **Scalabilty**: As your organization grows, you carve new subnets out of your main IP block—no need to renumber everything.

**Quick Visual**

```
           192.168.1.0/24
       ┌────────┴─────────┐
192.168.1.0/25       192.168.1.128/25
(Hosts .1–.126)      (Hosts .129–.254)
```

### CIDR(Classless inter-Domain Routing)

CIDR is a compact notation that represent the IP address blocks and their subnet masks without relying on the old classful boundries as i shown above. It combines an IP address with prefix length to indicate how many bits of the network defines the network portion.

it defined as:
```
<network-address>/<prefix-length>
```
* `network-address` is the starting IP of the block
* `prefix-length` is a number from 0 to 32 in case of IPv4 as it is 32 bit long and from 0 to 128 for the IPv6 that shows the how many leading bits are the network portion.

**Example IPv4**
* `192.168.1.0/24`
   * so, `/24` shows that first 24 bits which is 192.168.1 is the network portion.
     
   * Host portion is 8-bits and can be any thing between 0-255.
     
   * This block covers addresses from 192.168.1.0 to 132.168.1.255 total 256 addresses.

**Example (IPv6):**

* `2001:db8::/32`

  * Network portion: first 32 bits

  * This block covers 2^(128−32) addresses—enough for billions of hosts!

 **Why do we needed the CIDR?**

 It eliminates wasted address space inherent in classful addressing. It enables flexible subnetting of any size. It also provides route summerization by aggrigating routes.

 ### Calculating Hosts from CIDR
 * As we know there are total 32 bits in IPv4.
 * So, the prefix length can be anything between 0-32.

| CIDR | Host Bits | Total Addresses | Usable Hosts\* |
| ---- | --------- | --------------- | -------------- |
| /24  | 8         | 2³²⁻²⁴ = 256    | 254            |
| /25  | 7         | 128             | 126            |
| /26  | 6         | 64              | 62             |
| /27  | 5         | 32              | 30             |
| /28  | 4         | 16              | 14             |
| /30  | 2         | 4               | 2              |

**Visualizing the bitmask**
* Take /26 as an example:
  
```
255.255.255.192  = 11111111.11111111.11111111.11000000
                                  ↑↑       ↑
                          network bits ↓ host bits
```

* This example make understanding really easy. First 26 bits are assigned for network and we have only 6 bits left for the host portion. So, we are creating subnet of 2<sup>6</sup> = 62 addresses.

### Default Gateway

The default gateway is the device on your local network that acts as the “exit ramp” to other networks—usually the internet.

* **Purpose:**
When a device needs to communicate with a host on a different network, it sends the traffic to the default gateway. The gateway then forwards the packets toward their destination.

* **Intra‑network Traffic:**
For devices on the same subnet, traffic is sent directly without involving the default gateway.

* **Typical Default Gateway:**
In most home or office setups, your router serves as the default gateway.

> Example (IPv4):
> * Host IP: 192.168.0.10/24
> * Default gateway: 192.168.0.1
> * To send a packet to 8.8.8.8, the host forwards it to 192.168.0.1, since 8.8.8.8 is outside the 192.168.0.0/24 network.
