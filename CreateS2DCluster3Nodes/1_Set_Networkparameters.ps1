Get-NetQosPolicy | Remove-NetQosPolicy
Get-NetQosTrafficClass | Remove-NetQosTrafficClass

Set-NetQosDcbxSetting -InterfaceAlias "pNIC1-Port1" -Willing $False
Set-NetQosDcbxSetting -InterfaceAlias "pNIC1-Port2" -Willing $False

New-NetQosPolicy -Name "SMB" -NetDirectPortMatchCondition 445 -PriorityValue8021Action 3
New-NetQosPolicy -Name "Cluster-HB" -Cluster -PriorityValue8021Action 7
New-NetQosPolicy -Name "Default" -Default -PriorityValue8021Action 0

Enable-NetQosFlowControl -Priority 3

Disable-NetQosFlowControl -Priority 0,1,2,4,5,6,7

Enable-NetAdapterQos -Name "pNIC1-Port1"
Enable-NetAdapterQos -Name "pNIC1-Port2"

New-NetQosTrafficClass "SMB" -Priority 3 -BandwidthPercentage 50 -Algorithm ETS
New-NetQosTrafficClass "Cluster-HB" -Priority 7 -BandwidthPercentage 1 -Algorithm ETS

Set-NetAdapterAdvancedProperty -Name "pNIC1-Port1" -RegistryKeyword "*FlowControl" -RegistryValue 0
Set-NetAdapterAdvancedProperty -Name "pNIC1-Port2" -RegistryKeyword "*FlowControl" -RegistryValue 0
