# run_chia_ploter_powershell
Script for starting a plotter with ayrvbtk with preliminary cleaning of the temporary folder and logging'


## Powershell run 
open folder script

``` 
cd c:\bin
git clone git@github.com:f00x/run_chia_ploter_powershell.git
cd c:\bin\run_chia_ploter_powershell ```


```./runChiaPlot.ps1 -iterationNumber 10  -keyProcess "ssd_to_y" -waletNumber 00000 -tread 4 -ram 6000  -tempPath "c:\chia\temp" -desdestenationPath "y:\chia\complete"```

### Other folder plotter chia

```./runChiaPlot.ps1 -plotterPath $Env:USERPROFILE\AppData\Local\chia-blockchain\app-1.1.4\resources\app.asar.unpacked\daemon\chia.exe -iterationNumber 10  -keyProcess "ssd_to_y" -waletNumber 00000 -tread 4 -ram 6000  -tempPath "c:\chia\temp" -desdestenationPath "y:\chia\complete"```


other parameter

```
    $plotterPath="$Env:USERPROFILE\AppData\Local\chia-blockchain\app-1.1.2\resources\app.asar.unpacked\daemon\chia.exe",
    $tempPath="C:\chia\temp",
    $destenationPath='C:\chia\complete',
    $keyProcess="default",
    $waletNumber=000000,
    $thisFolder=(Split-Path -Parent $MyInvocation.MyCommand.Path),
    $logFolder=(Join-Path -Path $thisFolder -ChildPath "log"),
    $tread=4,
    $ram=6000,
    $iterationNumber=1  
```
