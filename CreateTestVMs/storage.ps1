$cred = Get-Credential

1..10 | % {

    $VMName = "Test-VM$_"

    Invoke-Command -VMName $VMName -ScriptBlock {C:\DiskSpd\amd64\diskspd.exe -c1G -b512k -d6000 -w50 benchmark.bin} -Credential $cred -AsJob

}
