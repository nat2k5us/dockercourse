import re, operator

with open('output.log', 'r') as file:
    fi = file.readlines()

re_ip = re.compile("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}")
ip_list = []
for line in fi:
    ip = re.findall(re_ip, line)
    ip_list.append(ip)

# empty dictionary
ip_dict = {}
for ip in ip_list:
    if str(ip) in ip_dict.keys():
        # print(ip_dict.get(str(ip)))
        ip_dict.update({str(ip): int(ip_dict.get(str(ip)))+1})
    else:
        # print(ip_dict.get(str(ip)))
        ip_dict.update({str(ip):  1 })

for k, v in dict(sorted(ip_dict.items(), key=operator.itemgetter(1), reverse=True)).items():
    print(v, k)
