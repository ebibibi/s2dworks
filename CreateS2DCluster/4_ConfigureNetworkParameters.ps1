Install-WindowsFeature -Name Data-Center-Bridging
New-NetQosPolicy "SMB" -NetDirectPortMatchCondition 445 -PriorityValue8021Action 3
Enable-NetQosFlowControl -Priority 3
Disable-NetQosFlowControl -Priority 0,1,2,4,5,6,7
Enable-NetAdapterQos -Name "Slot6 ポート 1", "Slot6 ポート 2"
New-NetQosTrafficClass "SMB" -Priority 3 -BandwidthPercentage 50 -Algorithm ETS
Set-NetAdapterAdvancedProperty -Name "Slot6 ポート 1" -RegistryKeyword "*FlowControl" -RegistryValue 0
Set-NetAdapterAdvancedProperty -Name "Slot6 ポート 2" -RegistryKeyword "*FlowControl" -RegistryValue 0
