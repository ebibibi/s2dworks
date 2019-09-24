$AzureGatewayIpAddress = "13.71.132.227" # VPN Gateway��Global IP
$Subnets = @("10.1.0.0/24","10.1.255.0/27") # Azure ���̃T�u�l�b�g �z��ł��邱�Ƃɒ��� @("xxx", "xxx", ...)
$PresharedKey = "AzurenoKey" # VPN Gateway�\�z���ɓ��͂���PSK�Ɠ�������



# Add and configure S2S VPN interface
Add-VpnS2SInterface -Protocol IKEv2 -AuthenticationMethod PSKOnly -NumberOfTries 3 -ResponderAuthenticationMethod PSKOnly -Name $AzureGatewayIPAddress -Destination $AzureGatewayIPAddress -IPv4Subnet $Subnets -SharedSecret $PresharedKey
Set-VpnServerConfiguration -TunnelType IKEv2 -EncryptionType MaximumEncryption
Restart-Service RemoteAccess
sleep 10 # <- �ǉ�
Set-VpnS2Sinterface -Name $AzureGatewayIPAddress -InitiateConfigPayload $false -Force

# Set S2S VPN connection to be persistent by editing the router.pbk file (required admin priveleges)
#Set-PrivateProfileString $env:windir\System32\ras\router.pbk "$AzureGatewayIPAddress" "IdleDisconnectSeconds" "0"
#Set-PrivateProfileString $env:windir\System32\ras\router.pbk "$AzureGatewayIPAddress" "RedialOnLinkFailure" "1"

# Restart the RRAS service
Restart-Service RemoteAccess
sleep 10 # <- �ǉ�

# Dial-in to Azure gateway
Connect-VpnS2SInterface -Name $AzureGatewayIPAddress