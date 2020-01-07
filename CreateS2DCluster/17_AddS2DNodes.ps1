Set-Item -Path WSMan:\localhost\Client\TrustedHosts -value "s2dnode1.s2d.local,s2dnode2.s2d.local,s2dnode3.s2d.local,s2dnode4.s2d.local" -Force
Test-Cluster -Node s2dnode1, s2dnode2, s2dnode3, s2dnode4 -Include "Storage Spaces Direct", �C���x���g��, �l�b�g���[�N, �V�X�e���̍\��

Get-ClusterNode
Get-ClusterS2D
Get-ClusterResource

Get-StoragePool
Get-VirtualDisk
Get-PhysicalDisk
Get-StorageJob


#-----------------------------
Add-ClusterNode -Name s2dnode3

Get-ClusterNode
Get-ClusterS2D
Get-ClusterResource

Get-StoragePool
Get-VirtualDisk
Get-PhysicalDisk
Get-StorageJob


#-----------------------------
Add-ClusterNode -Name s2dnode4

Get-ClusterNode
Get-ClusterS2D
Get-ClusterResource

Get-StoragePool
Get-VirtualDisk
Get-PhysicalDisk
Get-StorageJob