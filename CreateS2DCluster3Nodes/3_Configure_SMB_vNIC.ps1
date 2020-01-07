#for node1
New-NetIPAddress -InterfaceAlias "pNIC1-Port1" -IPAddress 10.10.11.11 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "pNIC1-Port2" -IPAddress 10.10.12.11 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "vEthernet (vNIC-Host)" -IPAddress 172.17.112.180 -PrefixLength 16 -DefaultGateway 172.17.1.254

#for node2
New-NetIPAddress -InterfaceAlias "pNIC1-Port1" -IPAddress 10.10.13.12 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "pNIC1-Port2" -IPAddress 10.10.12.12 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "vEthernet (vNIC-Host)" -IPAddress 172.17.112.181 -PrefixLength 16 -DefaultGateway 172.17.1.254

#for node3
New-NetIPAddress -InterfaceAlias "pNIC1-Port1" -IPAddress 10.10.13.13 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "pNIC1-Port2" -IPAddress 10.10.11.13 -PrefixLength 24
New-NetIPAddress -InterfaceAlias "vEthernet (vNIC-Host)" -IPAddress 172.17.112.182 -PrefixLength 16  -DefaultGateway 172.17.1.254


Set-DnsClient -InterfaceAlias "pNIC1-Port1" -RegisterThisConnectionsAddress $false
Set-DnsClientServerAddress -InterfaceAlias "pNIC1-Port1" -ServerAddresses ("172.17.112.177")
Set-DnsClient -InterfaceAlias "pNIC1-Port2" -RegisterThisConnectionsAddress $false
Set-DnsClientServerAddress -InterfaceAlias "pNIC1-Port2" -ServerAddresses ("172.17.112.177")
Set-DnsClientServerAddress -InterfaceAlias "vEthernet (vNIC-Host)" -ServerAddresses ("172.17.112.177")
