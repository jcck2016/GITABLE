$servers = @("VITLOADGEN01","VITLOADGEN03","VITLOADGEN09", "VIDSMARTOFFICE1")
$scriptBlock = {
    Get-EventLog -LogName Application | Where-Object { $_.Message -match "error" } | Select-Object -Last 10 | Export-Csv -Path C:\Temp\error.csv
}

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock $scriptBlock
}
