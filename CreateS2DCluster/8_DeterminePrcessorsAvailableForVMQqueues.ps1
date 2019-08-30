#CPUコアが何個あり、HyperThreadingが有効になっているかどうかの確認
Get-WmiObject -Class win32_processor | ft -Property NumberOfCores, NumberOfLogicalProcessors -AutoSize

Get-NetAdapterRSS