1..10 | % {
 
$VMName = "Test-VM$_"
 
Write-Host "Create VM $VMName" -BackgroundColor Black -ForegroundColor White
New-VM -Name $VMName -MemoryStartupBytes 8GB -SwitchName S2DSwitch -Path C:\ClusterStorage\Mirror\ -Generation 2
 
Write-Host "Copy VHD..." -BackgroundColor Black -ForegroundColor Green
Copy-item 'C:\MasterVHDs\Virtual Hard Disks\' -Destination "C:\ClusterStorage\Mirror\$VMName" -Recurse
 
Write-Host "Attach VHD..." -BackgroundColor Black -ForegroundColor Green
Add-VMHardDiskDrive -VMName $VMName -ControllerType SCSI -ControllerNumber 0 -Path "C:\ClusterStorage\Mirror\$VMName\Virtual Hard Disks\2019.vhdx"
 
Write-Host "Configure Virtual Machine..." -BackgroundColor Black -ForegroundColor Green
Set-VM -Name $VMName -MemoryStartupBytes 8GB -ProcessorCount 2
$hddboot = $networkboot = (Get-VMFirmware -VMName $VMName).BootOrder | Where-Object {$_.BootType -eq "Drive"}
Set-VMFirmware -VMName $VMName -BootOrder $hddboot

Set-VMNetworkAdapter -VMName $VMName
 
Write-Host "Startup Virtual Machine: $VMName..." -BackgroundColor Black -ForegroundColor Green
Set-VMNetworkAdapterVlan -VMName $VMName -Access -VlanId 12

Add-ClusterVirtualMachineRole -VMName $VMName

Start-VM -Name $VMName
}
