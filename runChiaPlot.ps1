Param(
    $plotterPath="C:\Users\lisin\AppData\Local\chia-blockchain\app-1.1.2\resources\app.asar.unpacked\daemon\chia.exe",
    $tempPath="C:\chia\temp",
    $destenationPath='C:\chia\complete',
    $keyProcess="f00x",
    $waletNumber=3534245359,
    $thisFolder=(Split-Path -Parent $MyInvocation.MyCommand.Path),
    $logFolder=(Join-Path -Path $thisFolder -ChildPath "log"),
    $tread=4,
    $ram=6000,
    $iterationNumber=1  
)
If(!(test-path $tempPath))
{
      New-Item -ItemType Directory -Force -Path $tempPath
}
If(!(test-path  $destenationPath))
{
      New-Item -ItemType Directory -Force -Path  $destenationPath
}
If(!(test-path  $logFolder))
{
      New-Item -ItemType Directory -Force -Path  $logFolder
}
# чистим папку перед стартом нового плота
Remove-Item  -Path (join-Path  -Path $tempPath -ChildPath "*")
Set-Variable -Name dateString -Value ((GET-Date).ToString('yyyy-MM-dd_H-m-s'))
Set-Variable -Name mainLogPath -Value (Join-Path -Path $logFolder -ChildPath "_main.log")
Write-Host "log to $logFilePath"
$iterationNumber


for (($i = 0); $i -lt $iterationNumber; ($i++))
{   Set-Variable -Name startIteration -Value (Get-Date);
    Set-Variable -Name logFilePath -Value (Join-Path -Path $logFolder -ChildPath "${keyProcess}_${i}_$iterationNumber_$($startIteration.ToString('yyyy-MM-dd_H-m-s')).log")
    Write-Host $logFilePath
    Write-Host "$plotterPath plots create -k32 -u128 -n1 -r$tread -b$ram -a$waletNumber -t$tempPath -d$destenationPath"
    Invoke-expression "$plotterPath plots create -k32 -u128 -n1 -r$tread -b$ram -a$waletNumber -t$tempPath -2$tempPath -d$destenationPath"| Out-File $logFilePath

    Set-Variable -Name durationIteration -Value (New-TimeSpan -Start $startIteration)
    Set-Variable -Name durationString -Value "$($durationIteration.Days) day $($durationIteration.Hours):$($durationIteration.Hours):$($durationIteration.Minutes):$($durationIteration.Seconds)" 
    "$keyProcess iteration:$i Time:$durationString"
     "$(Get-Date -Format 'yyyy.MM.dd HH:mm:ss') K plot ended ($keyProcess $i|$iterationNumber tread:$tread ram:$ram ) $durationString  tempFolder:$tempPath destenationPath:$destenationPath "|Out-File  -FilePath $mainLogPath  -Encoding ASCII -Append 
}
