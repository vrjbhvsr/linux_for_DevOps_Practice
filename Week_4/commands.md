# IP addressing and hostnames

## 1. IP addresss and Routes
🔹 To View current IP address

```bash
ip addr show 

# or in shorthand
ip a

```
> 🧠 This command is used to display all the interfaces on your linux system and their assigned IP addresses.

For each netwok interface it shows,

1. Interface name(such as eth0, lo, enp0)
>  interfaces are communication endpoints — they connect your system to networks. There are different types of interfaces, each with its own purpose.
> **eth0 and similar** are ethernet interface which is wired interfaces that connects the machine to physical LAN. (Ethernet cable)
> **lo** is loopback interface that is use for device to talk to itself.
> **wl or wlan** that connects to wifi.

**"In a nutshell, interfaces are like the main doors or entry points of a device where IP addresses are assigned, enabling communication over a network.”**

2. MAC address: Hardware address
3. IP addresses assigned (IPv4 and/or IPv6)
4. MTU(Maximum Transmission Unit)
> It defines the largest packet size that can be sent over network interface in a single piece.
>Default MTU for Ethernet:
Typically 1500 bytes.

🔍 Check current MTU:
```bash
ip link show enp0s3
```

🛠️ Change MTU temporarily:
```bash
sudo ip link set dev enp0s3 mtu 1400
```
5. Flags(Like UP, BROADCAST,MULTICAST)


🔍 Exaple Output

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/ip%20a.png)

🔹To display the system's routing table

```bash
ip route show

# or in shorthand

ip r
```
📦 What is a routing table?

A routing table contains rules that tell your system:

* “Where to send traffic that isn’t for the local network?”

* “Which gateway (router) should I use to reach other networks?”

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/ipr.png)


1. default via 10.0.2.2 dev enp0s3 proto dhcp src 10.0.2.15 metric 100(for oher subnet and over internet)
   
    > This is the default route- traffic to the internet goes via the gateway(router) at 10.0.2.2 through the network interface enp0s3
2. 10.0.2.0/24 dev enp0s3 prto kernel scope link src 10.0.2.15 metric 100( for same subnet, communicate within the same subnet)

    > This tells Linux: "To reach devices on the 10.0.2.0/24 subnet, use the enp0s3 interface directly."

🔹 metric 100 → Used to rank multiple routes (lower = higher priority). Not important here unless you have more than one default route.

**💡 In simpler words:**

* If I'm trying to reach 10.0.2.20 (same subnet) → send directly.

* If I'm trying to reach 8.8.8.8 (outside network) → send to 10.0.2.2 (the default gateway).


## 2. Static IP vs Dynamic IP

DHCP (Dynamic Host Configuration Protocol) automatically assigns dynamic IP addresses to devices on a network, meaning the IP can change over time.

However, in the case of servers, printers, routers, or any critical network device, we often need the IP address to remain constant and reachable.

That’s why we assign a static IP address manually — so the device always has the same IP, ensuring stability and easier access in the network.

**📌 Why Static IPs Are Used for Servers:**

* So clients can consistently connect to the same address (e.g., a web server at 192.168.1.10)

* Avoid disruptions in services caused by changing IPs

* Easier to configure DNS, firewall rules, and monitoring tools

### Assigning static IP to the system

**Temporary static IP using ip command**

Useful for quick testing. This will reset on reboot.

To assign temporary static IP we can use follow the below commands:

**1. Remove all the current IPs**

```bash
sudo ip addr flush dev enp0s3 #Remove current IPs first
```

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/ipflush.png)

**2. Add new temporary static IP**

```bash
sudo ip addr add 10.0.2.62/24 dev enp0s3 # assign static IP with interface
```

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/ipadd.png)

**3. Add the route for the new IP**

```bash
sudo ip route add default via 10.0.2.2
```

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/iprut.png)

Now, we have successfully assigned temporary static IP to our system.

**To check if the IP is working or not we can verify using:**

```bash
ip a
ip r
ping 8.8.8.8
```


**To remove the setting without breaking anything**

```bash
sudo ip addr del 10.0.2.62/24 dev enp0s3
```


**💾 Permanent IP Configuration**

* This depends on your Linux distribution.

* I am using Ubuntu, so i will configure /etc/netplan/.

* Edit the Netplan config (usually in /etc/netplan/*.yaml):

```bash
cd /

ls /etc/netplan/
```

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/psip.png)

After you find the `yaml` files, check the file permissions whether they can be read, write by owner. if not then set:

```bash
sudo chmod 600 /etc/netplan/50-cloud-init.yaml
```

* Now, you open a  yaml file using vim editor or any editor and edit configuration

```bash
sudo vim /etc/netplan/50-cloud-init.yaml
```

Make following changes:

```yaml
network:
  version: 2
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: 
        - 10.0.2.62/24
      routes:
        - to: default
          via: 10.0.2.2
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
```

**After changes have been made we apply using:**

```bash
sudo netplan apply
```

After rebooting the system `sudo reboot` the permenent static Ip has been assigned to system.

## 🔹 Hostname Configuration

🧭 What is a Hostname?

A hostname is the name given to a computer or device on a network. It is used to identify the system in a human-readable way. Just like every person has a name in a classroom, every computer in a network has a hostname.

   > For example, instead of remembering that your web server is at 10.0.2.62, you can refer to it as webserver1.local or lfcs-node1.

**There are 3 main types of hostnames:**

* static: Set by the system and used across reboots.

* pretty: A user-friendly display name (like “Vraj’s Laptop”).

* transient: Temporary, used during runtime, but reset on reboot.

**Linux systems mainly rely on static hostnames.**

**🛠 Check and Change Your Hostname**

To see your current hostname:

```bash
hostnamectl status
```

🔍 Example Output:

![Screenshot](https://github.com/vrjbhvsr/linux_for_DevOps_Practice/blob/main/Week_4/Screenshots/hstnm.png)


To set your hostname to something more meaningful:

```bash
sudo hostnamectl set-hostname lfcs
```

To confirm the change:

```bash
hostnamectl
hostname
```
**📁 /etc/hosts File**

After setting the hostname, you also need to update the /etc/hosts file so your own system knows how to resolve your hostname into an IP address (usually the IP of the local system).

Edit the file using:

```bash
sudo vim /etc/hosts
```
and add:

```
127.0.0.1       localhost
10.0.2.62       lfcs
```

This helps commands like ping or other apps resolve the name lfcs-node1 to the correct IP.

**Ping by Hostname**

```bash
ping lfcs
```

If it replies, hostname resolution works! Your system is able to match the name with an IP.



