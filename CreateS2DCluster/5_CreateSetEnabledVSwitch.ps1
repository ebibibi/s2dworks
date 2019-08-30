New-VMSwitch -Name S2DSwitch -NetAdapterName "Slot6 ポート 1", "Slot6 ポート 2" -EnableEmbeddedTeaming $true -AllowManagementOS $false
Add-VMNetworkAdapter -SwitchName S2DSwitch -Name SMB1 -ManagementOS
Add-VMNetworkAdapter -SwitchName S2DSwitch -Name SMB2 -ManagementOS
Enable-NetAdapterRDMA -Name "vEthernet (SMB1)", "vEthernet (SMB2)"
Set-VMNetworkAdapterVlan -VMNetworkAdapterName SMB1 -VlanId 12 -Access -ManagementOS
Set-VMNetworkAdapterVlan -VMNetworkAdapterName SMB2 -VlanId 12 -Access -ManagementOS
Set-VMNetworkAdapterTeamMapping -VMNetworkAdapterName SMB1 -PhysicalNetAdapterName "Slot6 ポート 1" -ManagementOS
Set-VMNetworkAdapterTeamMapping -VMNetworkAdapterName SMB2 -PhysicalNetAdapterName "Slot6 ポート 2" -ManagementOS
