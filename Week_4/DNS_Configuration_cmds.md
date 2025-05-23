# DNS Configuration

When your Linux system needs to connect to a website (like example.com), it must first resolve that human-readable domain name into an IP address. That’s where DNS — the Domain Name System — comes in. Without DNS, you'd have to remember the IP address of every website you want to visit.

**Why do we configure DNS?**
There are two main reasons why do we need to configure DNS:

1. To ensure the system knows where to ask for IP addresses when resolving domain names.

2. To override or customize this behavior for specific networks, servers, or use cases(e.g., internal domains, custom nameservers, better privacy or speed).

**We configure DNS when:**
* The system is not resolving names properly.

* we want to use public DNS (like Google’s 8.8.8.8 or Cloudflare’s 1.1.1.1).

* we are setting up a server that shouldn't rely on automatic provided settings.

* We are in an enterprise or internal network with its own DNS rules.

**Where does Linux store DNS settings?**

Traditionally, Linux systems use a file called /etc/resolv.conf. 

```bash
cat /etc/resolv.conf
```

🔍 Exaple Output

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/catres.png)

* Here, this is default behavior of ubuntu systems that uses systemd-resolved.

* It showing the nameserver `127.0.0.53` means system using **local DNS stub resolver** provided by systemd-resolved. it is a loopback ip that points back to my own system. it's not real DNS server.

* The system or apps like browser ask loopback ip 127.0.0.53 for DNS resolution, and systemd-resolved handels it.
    > Apps → 127.0.0.53 (local stub resolver) → forwards to → real upstream DNS (e.g., 8.8.8.8 or DHCP-provided).


### 🛠️ DNS Resolution in Ubuntu – What Actually Happens Behind the Scenes

When I configured a permanent static IP using etc/netplan/*.yaml, I included custom DNS nameservers like 1.1.1.1 (Cloudflare) and 8.8.8.8 (Google DNS).

✅ But here's an interesting part of how DNS resolution works on systems like Ubuntu that use systemd-resolved:

🔍 When you type a website name in your browser, your system first checks the local DNS stub resolver, as referenced in /etc/resolv.conf.
Even though I've set external nameservers in the Netplan config, /etc/resolv.conf still points to 127.0.0.53 — that’s the local resolver managed by systemd-resolved.

🔄 Eventually, systemd-resolved reads the DNS entries from the Netplan-generated config and forwards the query to the specified upstream DNS servers (like 1.1.1.1 or 8.8.8.8).

⚠️ Note: You should not manually edit /etc/resolv.conf — it’s a dynamically generated symlink that points to the stub resolver. Any manual changes will be overwritten.

**Where does systemd-resolved get its real DNS servers from?**
It depends on how your system is configured:

* If you're using DHCP, the DNS servers are received from your DHCP server (usually your router).

* If you've defined a static IP via Netplan (and included nameservers:), those DNS IPs are used.

* NetworkManager or other tools can also push DNS servers into systemd-resolved.


**To check which real DNS servers are in use (beyond 127.0.0.53), run:**

```bash
resolvectl status

# or

systemd-resolve --status

```

🔍 Exaple Output

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/DNSsts.png)



