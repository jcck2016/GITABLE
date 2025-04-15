[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")  

$Form = New-Object System.Windows.Forms.Form    
$Form.Size = New-Object System.Drawing.Size(500,625)  
$form.Text = "IT Team ID Management - Get permissions for network share"

############################################## Start functions

function pingInfo {
$wks=$InputBox.text;
$pingResult=ping $wks | fl | out-string;
$outputBox.text=$pingResult
                     } #end pingInfo
					 
function permInfo {
$uncpath=$InputBox.text;
#$permResult=Get-Acl $uncpath | fl -Property AccessToString | out-string;
$permResult=(Get-Acl $uncpath).access | where {$_.AccessControlType -eq "Allow"} | where { $_.identityreference -like "ad\*"} | select @{Name="Group Name";Expression={$_.identityreference}},@{Name="Access";Expression={$_.filesystemrights}}  | fl | out-string;
$outputBox.text=$permResult
                     } #end permInfo
					 #Get-Acl "\\server\share" | Format-List
############################################## end functions

############################################## Start text fields

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,10) 
$label.Size = New-Object System.Drawing.Size(500,20) 
$label.Text = "Please enter the full UNC in the space below - \\servername\share\path"
$form.Controls.Add($label) 

$InputBox = New-Object System.Windows.Forms.TextBox 
$InputBox.Location = New-Object System.Drawing.Size(10,40) 
$InputBox.Size = New-Object System.Drawing.Size(300,20) 
$Form.Controls.Add($InputBox) 

$outputBox = New-Object System.Windows.Forms.TextBox 
$outputBox.Location = New-Object System.Drawing.Size(10,75) 
$outputBox.Size = New-Object System.Drawing.Size(465,500) 
$outputBox.MultiLine = $True 
$outputBox.ScrollBars = "Vertical" 
$Form.Controls.Add($outputBox) 

############################################## end text fields

############################################## Start buttons

$Button = New-Object System.Windows.Forms.Button 
$Button.Location = New-Object System.Drawing.Size(320,40) 
$Button.Size = New-Object System.Drawing.Size(110,20) 
$Button.Text = "Get Permissions" 
$Button.Add_Click({permInfo}) 
$Form.Controls.Add($Button) 

############################################## end buttons

$Form.Add_Shown({$Form.Activate()})
[void] $Form.ShowDialog()