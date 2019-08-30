#Mirror Volume
New-Volume -StoragePoolFriendlyName S2DPool -FriendlyName "Mirror" -FileSystem CSVFS_ReFS -StorageTierFriendlyNames Capacity -StorageTierSizes 5TB

#Parity Volume
#New-Volume -StoragePoolFriendlyName S2DPool -FriendlyName "Parity" -FileSystem CSVFS_ReFS -StorageTierFriendlyNames Capacity -StorageTierSizes 5TB

#Resilient Volume
#New-Volume -StoragePoolFriendlyName S2DPool -FriendlyName "Resilient" -FileSystem CSVFS_ReFS -StorageTierFriendlyNames Performance, Capacity -StorageTierSizes 2TB, 3TB
