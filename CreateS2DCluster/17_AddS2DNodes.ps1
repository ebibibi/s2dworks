Set-Item -Path WSMan:\localhost\Client\TrustedHosts -value "s2dnode1,s2dnode2,s2dnode3,s2dnode4" -Force
Test-Cluster -Node s2dnode1, s2dnode2, s2dnode3, s2dnode4 -Include "Storage Spaces Direct", インベントリ, ネットワーク, システムの構成

Add-ClusterNode -Name s2dnode3
Add-ClusterNode -Name s2dnode4

