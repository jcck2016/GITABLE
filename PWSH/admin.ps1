*insert-your-thing - meaning searching anything that END with the term "insert-your-thing"  ... because the star symbol means "anything" .. comes BEFORE the "insert-your-thing"
insert-your-thing* - meaning searching anything that START with the term "insert-your-thing"  ... because the star symbol means "anything" .. comes AFTER the "insert-your-thing"
*insert-your-thing* - meaning searching anything that CONTAIN with term "insert-your-thing"  ... because the star symbol means "anything" .. comes AROUND the "insert-your-thing"


Powershell command examples .........

find-command *ad    .... find all available powershell commands on your system that have the string "ad" at the end of the commandlet name
get-service -name t*  ... find a service named start with the letter "t"
find-module -name *ssh*  .... find new powershell modules available to install that contains the string "ssh" in the module name 

pattern search example ......

launch powershell and browse into  c:\temp
and run notepad to create a sample log file named "log.txt"  ..... notepad log.txt
copy and paste the below into the file and save it

Status OK 		1/1/2025  server:  Crossroads
Status ERROR 		1/2/2025  server: Observatory
Status OK		1/3/2025  server : Whisperwind 
Status OK		1/4/2025  server: Algorithmic 
Status OK		1/5/2025  server : Whisperwind 
Status Error		1/6/2025  server : Whisperwind 
Status OK		1/7/2025  server: Observatory
Status ERROR		1/8/2025  server : Whisperwind 
Status ERROR		1/9/2025   server:  Crossroads
Status ERROR		1/10/2025  server: Observatory
Status ERROR		1/11/2025  server: Algorithmic
Status OK		1/12/2025  server:  Crossroads


try this ... this will rip out lines with status either OK or ERROR

get-content .\log.txt | Select-String "ERROR"
get-content .\log.txt | Select-String "OK"

try this ... this will rip out lines with status either OK or ERROR

Get-Content .\log.txt | Select-String "ERROR" | Select-Object -Last 5
Get-Content .\log.txt | Select-String "OK" | Select-Object -Last 2
Get-Content .\log.txt | Select-String "ERROR" | Where-Object { $_ -match "ob" }
Get-Content .\log.txt | Select-String "ERROR" | Where-Object { $_ -match "o" } | Select-Object -First 2

Get-Content .\log.txt | Select-String "ERROR" | Where-Object { $_ -match "\b\w*[oO]\w*\b" } | Select-Object -Last 3
 Get-Content .\log.txt | Select-String "ERROR" | Where-Object { $_ -notmatch "\b[Oo]" } | Select-Object -Last 3
 
 Get-EventLog -LogName Application | Where-Object { $_.Message -match "error" } | Select-Object -Last 10
 Get-EventLog -LogName Application | Where-Object { $_.EventID -eq 1035 } | Select-Object -Last 10
Get-EventLog -LogName Application | Where-Object { $_.Message -match "error" } | Select-Object -Last 10 | Export-Csv -Path C:\Temp\error.csv


$servers = @("server1", "server2", "server3", "server4")
$scriptBlock = {
    Get-EventLog -LogName Application | Where-Object { $_.Message -match "error" } | Select-Object -Last 10 | Export-Csv -Path C:\Temp\error.csv
}

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
}



============

VITLOADGEN01
VITLOADGEN02
VITLOADGEN03
VSTLOADGEN05
VSTLOADGEN06
VSTLOADGEN07


$servers = @("VITLOADGEN01", "VITLOADGEN02", "
","VSTLOADGEN05","VIDSMARTOFFICE1" )
$ports = @(5985, 5986)
$results = @()

foreach ($server in $servers) {
    $serverResult = [PSCustomObject]@{
        Server = $server
        Port5985 = $false
        Port5986 = $false
    }
    
    foreach ($port in $ports) {
        $connection = Test-NetConnection -ComputerName $server -Port $port -InformationLevel Quiet
        if ($connection) {
            if ($port -eq 5985) {
                $serverResult.Port5985 = $true
            } elseif ($port -eq 5986) {
                $serverResult.Port5986 = $true
            }
        }
    }
    
    $results += $serverResult
}

$results | Format-Table -AutoSize



 Connecting to remote server server1 failed with the following error message : WinRM cannot complete the operation. Verify that the specified computer name is valid, that the computer is accessible over the network,
and that a firewall exception for the WinRM service is enabled and allows access from this computer. By default, the WinRM firewall exception for public profiles limits access to remote computers within the same local subnet. For more
information, see the about_Remote_Troubleshooting Help topic.
    + CategoryInfo          : OpenError: (server1:String) [], PSRemotingTransportException
    + FullyQualifiedErrorId : WinRMOperationTimeout,PSSessionStateBroken

