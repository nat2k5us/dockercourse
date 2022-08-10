#!/bin/bash

# [29/Sep/2021:10:20:48+0100] 192.168.21.34 /healthz GET Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)
endpoints=(/healthz /ping /login /quotes /orders /play /status)
verbs=("GET" "POST" "HEAD" "PUT" "DELETE" "PATCH")
date_concat=$(date +"[%d/%b/%Y:00:00:00 +0000] ")
browsers=("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)" "Mozilla/5.0 (X11; Linux i686) AppleWebKit/5678 (KHTML, like Gecko) Chrome/37.0.800.0 Mobile Safari/5678" "Opera/10.31 (Macintosh; Intel Mac OS X 10_7_0; en-US) Presto/2.13.297 Version/12.00" "Mozilla/5.0 (iPhone; CPU iPhone OS 8_0_1 like Mac OS X; en-US) AppleWebKit/531.5.7" "Opera/9.41 (X11; Linux x86_64; en-US) Presto/2.9.243 Version/10.00")
ips=(124.169.136.132 23.45.46.193 37.202.189.200 141.176.230.228 137.197.232.13 124.52.29.57 163.13.215.207 109.224.208.91 40.22.98.76 133.128.26.170 164.226.191.185 185.27.61.104 176.47.182.106 223.76.77.108 38.234.208.224 217.116.193.234 242.167.24.238 109.127.249.227 170.242.159.135 34.133.58.156 197.250.101.75 77.45.113.243 112.75.29.102 3.94.7.78 236.78.131.109 49.198.153.29 212.184.249.111 62.234.215.154 179.25.253.45 213.193.192.170 161.85.73.217 249.203.117.15 181.28.153.121 70.147.226.251 109.108.114.187 96.131.189.204 202.85.79.244 36.217.152.245 71.88.206.55 122.168.52.131 57.143.244.5 73.65.113.27 121.91.208.126 56.239.214.159 219.64.106.137 101.190.92.58 212.166.251.183 140.230.193.104 23.74.64.99 205.215.30.53 )

rm -f output.log || exit 1
for item in {1..256}; do
    # var1=$(printf "%d.%d.%d.%d\n" "$((RANDOM % 1))" "$((RANDOM % 1))" "$((RANDOM % 1))" "$((RANDOM % 256))")
    endpoint="${endpoints[$((RANDOM % 6))]}"
    verb="${verbs[$((RANDOM % 5))]}"
    browser="${browsers[$((RANDOM % 5))]}"
    ip="${ips[$((RANDOM % 50))]}"
    echo "$item" "$date_concat" "$ip" "$endpoint" "$verb" "$browser" >> output.log
done
clear

echo "Using regex to extract the ips and then sort them, unique them and sort the uniques"
cat output.log | grep -Eo "[[:space:]][0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}[[:space:]]"  | sort | uniq -c | sort  
