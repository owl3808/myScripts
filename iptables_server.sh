#!/bin/sh
IPTABLES="/sbin/iptables"


"$IPTABLES" -F
$IPTABLES -X
$IPTABLES -Z
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -F INPUT
$IPTABLES -F OUTPUT


#$IPTABLES -P INPUT   ACCEPT
$IPTABLES -P INPUT   DROP
$IPTABLES -P OUTPUT  ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -t nat -P  PREROUTING ACCEPT
$IPTABLES -t nat -P      OUTPUT ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT


# accept local interface
$IPTABLES -A INPUT -i lo -j ACCEPT
#$IPTABLES -A INPUT -i eth0 -j ACCEPT


# accept http client
$IPTABLES -A INPUT -p tcp -s 0/0 --sport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --sport 8080 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --sport 443 -j ACCEPT


# accept http server
$IPTABLES -A INPUT -p tcp -s 0/0 --dport 80 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 140.116.0.0/16 --dport 8000 -j ACCEPT


# accept DNS
$IPTABLES -A INPUT -p udp -s 0/0 --sport 53 -j ACCEPT
$IPTABLES -A INPUT -p tcp -s 0/0 --sport 53 -j ACCEPT


# accept PING
#$IPTABLES -A INPUT -i eth0 -p icmp --icmp-type 8 -j ACCEPT
$IPTABLES -A INPUT -i eth0 -p icmp --icmp-type 0 -j ACCEPT


# setting for teamviewer
$IPTABLES -A INPUT -p tcp -i eth0 -d 0/0 --dport 5938 -j DROP
$IPTABLES -A INPUT -p tcp -i eth0 -s 0/0 --sport 5938 -j DROP
$IPTABLES -A INPUT -p tcp -i eth0 -s 0/0 --sport 5938 -j ACCEPT
$IPTABLES -A INPUT -p tcp -i eth0 -d 0/0 --dport 5938 -j ACCEPT


# accept NTP client
$IPTABLES -A INPUT -p udp -s 0/0 --sport 123 -j ACCEPT

# accept ssh server
$IPTABLES -A INPUT -p tcp -i eth0 --dport 22 -j ACCEPT

# accept ssh client
$IPTABLES -A INPUT -p tcp -i eth0 --sport 22 -j ACCEPT

# Port Forwarding
#iptables -t nat -A PREROUTING -i eth4 -p tcp --dport 7001 -j DNAT --to-destination 192.168.5.100:7001


# save iptables
#/etc/init.d/iptables save

#echo "$IPTABLES setting complete"
#echo "if anything OK, please press ctrl+c to break"
#echo "or wait 30 sec to clean up"

#sleep 30


#$IPTABLES -F
#$IPTABLES -X
#$IPTABLES -Z
#$IPTABLES -P   INPUT ACCEPT
