# Define variables
$datacenterName = "YourDatacenterName"
$clusterName = "YourClusterName"
$vmNames = @("VM1", "VM2") # Add your VM names here
# enter your password variable here .....
$domainName = "ad.uc.edu"
$domainUsername = "YourDomainUsername"
$domainPassword = "YourDomainPassword"

# Connect to vCenter
Connect-VIServer -Server "YourVCenterServer"

# Turn on VMs
foreach ($vmName in $vmNames) {
    $vm = Get-VM -Name $vmName -Location (Get-Cluster -Name $clusterName -Location (Get-Datacenter -Name $datacenterName))
    Start-VM -VM $vm
    Start-Sleep -Seconds 30

    # Invoke commands on the VM
    Invoke-VMScript -VM $vm -ScriptText "net user administrator $localAdminPassword" -GuestUser "administrator" -GuestPassword $localAdminPassword
    Invoke-VMScript -VM $vm -ScriptText "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False" -GuestUser "administrator" -GuestPassword $localAdminPassword

    # Configure IP address and subnet
    $ipAddress = Read-Host "Enter IP address for $vmName"
    $subnetMask = Read-Host "Enter Subnet Mask for $vmName"
    $gateway = Read-Host "Enter Gateway for $vmName"
    Invoke-VMScript -VM $vm -ScriptText "New-NetIPAddress -IPAddress $ipAddress -PrefixLength $subnetMask -DefaultGateway $gateway" -GuestUser "administrator" -GuestPassword $localAdminPassword

    # Test DNS connection
    $dnsServer = "YourDNSServer"
    $dnsTest = Invoke-VMScript -VM $vm -ScriptText "Test-Connection -ComputerName $dnsServer -Count 1" -GuestUser "administrator" -GuestPassword $localAdminPassword
    if ($dnsTest) {
        # Rename computer and join domain
        Invoke-VMScript -VM $vm -ScriptText "Rename-Computer -NewName $vmName -DomainCredential (New-Object System.Management.Automation.PSCredential('$domainUsername', (ConvertTo-SecureString '$domainPassword' -AsPlainText -Force)))" -GuestUser "administrator" -GuestPassword $localAdminPassword
        Invoke-VMScript -VM $vm -ScriptText "Add-Computer -DomainName $domainName -Credential (New-Object System.Management.Automation.PSCredential('$domainUsername', (ConvertTo-SecureString '$domainPassword' -AsPlainText -Force)))" -GuestUser "administrator" -GuestPassword $localAdminPassword
        Invoke-VMScript -VM $vm -ScriptText "Restart-Computer" -GuestUser "administrator" -GuestPassword $localAdminPassword

        # Disable firewall after reboot
        Start-Sleep -Seconds 60
        Invoke-VMScript -VM $vm -ScriptText "Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False" -GuestUser "$domainUsername" -GuestPassword "$domainPassword"

        Write-Host "$vmName joined the domain successfully with IP address $ipAddress"
    } else {
        Write-Host "DNS test failed for $vmName. Skipping domain join."
    }
}

# Disconnect from vCenter
Disconnect-VIServer -Confirm:$false


<#
can you please write a powercli script that joins 1 or more Windows VMs in a VMware environment ... steps propose as below       1. turn on the VM ( data center name, cluster name , VM names)
2. pause 30 sec for each VM or VMs to boot up
3. log in each VM with default local admin password "$123" (input local admin password for the first time log in) .. and perform the below tasks to each vm
4. disable all firewall in the local profile  ...  run powershell command Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
5. configure ip address and subnet (asking user input ip addresses and gateway information for each VM)
6. test connection to the existing DNS server, if ok, proceed rename the computer to match the VM name and to join the domain  "ad.uc.edu"
7. join the computer to the domain (input domain username and password)
8. reboot and log in as domain admin to disable firewall  .... Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
9. output message that each VM joined domain successfully with the provided ip addresses
Copilot said:

This script will:

Turn on the specified VMs.
Pause for 30 seconds to allow each VM to boot up.
Log in to each VM with the default local admin password and disable the firewall.
Configure the IP address and subnet for each VM based on user input.
Test the connection to the DNS server, rename the computer, and join the domain if the DNS test is successful.
Reboot the VM and disable the firewall again after logging in as the domain admin.
Output a message indicating the success of the domain join process.
Feel free to customize the script with your specific details. Let me know if you need any further assistance!

#>








