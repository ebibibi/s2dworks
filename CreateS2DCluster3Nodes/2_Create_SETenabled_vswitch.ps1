New-VMSwitch -Name "S2DSwitch" -NetAdapterName "LOM-Port1", "LOM-Port2" -EnableEmbeddedTeaming $true -AllowManagementOS $false

Add-VMNetworkAdapter -SwitchName "S2DSwitch" -Name "vNIC-Host" -ManagementOS

Enable-NetAdapterRdma -Name "pNIC1-Port1"
Enable-NetAdapterRdma -Name "pNIC1-Port2"

Disable-NetAdapterRdma -Name "LOM-Port1"
Disable-NetAdapterRdma -Name "LOM-Port2"


