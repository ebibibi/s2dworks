Invoke-Command -ComputerName s2dnode1, s2dnode2, s2dnode3, s2dnode4 -ScriptBlock { Get-Disk | ? Friendlyname -Like *ATA* | Set-Disk -IsOffline $False}
