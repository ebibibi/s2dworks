$ipaddress1 = "172.17.112.180"
$ipaddress2 = "172.17.112.181"

Set-NetIPInterface -InterfaceAlias "vEthernet (SMB1)" -Dhcp Disabled
New-NetIPAddress -InterfaceAlias "vEthernet (SMB1)" -IPAddress $ipaddress1 -PrefixLength 16 -DefaultGateway 172.17.1.254
Set-DnsClientServerAddress -InterfaceAlias "vEthernet (SMB1)" -ServerAddresses 172.17.112.177

Set-NetIPInterface -InterfaceAlias "vEthernet (SMB2)" -Dhcp Disabled
New-NetIPAddress -InterfaceAlias "vEthernet (SMB2)" -IPAddress $ipaddress2 -PrefixLength 16 -DefaultGateway 172.17.1.254
Set-DnsClientServerAddress -InterfaceAlias "vEthernet (SMB2)" -ServerAddresses 172.17.112.177 
