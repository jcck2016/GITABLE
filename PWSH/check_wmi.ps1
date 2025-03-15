$servers = @("VITLOADGEN01", "VITLOADGEN02", "VITLOADGEN03","VIDSMARTOFFICE1" )
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