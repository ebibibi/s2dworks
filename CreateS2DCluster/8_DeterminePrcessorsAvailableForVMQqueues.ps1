#CPU�R�A��������AHyperThreading���L���ɂȂ��Ă��邩�ǂ����̊m�F
Get-WmiObject -Class win32_processor | ft -Property NumberOfCores, NumberOfLogicalProcessors -AutoSize

Get-NetAdapterRSS