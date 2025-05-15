# Networking in Linux

1. Fundamentals: Understanding core concepts and CLI basic
   * IP Addressing
   * Subnetting, CIDR, and default gateways
   * DNS,DHCP,NAT
   * Ports, TCP vs UDP, ICMP(ping, traceroute)
   * OSI Model
  
## Networking Fundamentals

1. **IP Adressing**

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

  1. **Global Routing Prefix**: **First two block** of the address is GRP(Global Routing Prefix). In the above example `2001:0db8` is the GRP which identifies the larger network or internet service provider(ISP).
  2. **Subnet ID**: The next block after GRP is subnet ID. The subnet stands for sub-network meaning the one large network is divided into various subnets that help in IP address management and security.
  3. **Interface ID**: The rest of the blocks are the interface id that identifis the specific device on that subnet. This is simillar as the IPv4 host portions and changes per device.
    
🧠 **Simplified Breakdown**
 ```text
[ Global Prefix ][ Subnet ID ][ Interface ID ]
       48 bits     16 bits        64 bits
```

> *The last 64 bits are often based on the device's MAC address (EUI-64 format), but can also be randomly generated for privacy.*

