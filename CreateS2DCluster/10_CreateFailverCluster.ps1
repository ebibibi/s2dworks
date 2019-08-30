Test-Cluster -Node s2dnode1, s2dnode2, s2dnode3, s2dnode4 -Include "Storage Spaces Direct", インベントリ, ネットワーク, システムの構成

New-Cluster -Name S2DCluster -Node S2D01,S2D02,S2D03,S2D04 -NoStorage -StaticAddress 192.168.12.10
