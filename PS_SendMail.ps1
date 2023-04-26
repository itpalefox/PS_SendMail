$From = "your-gmail-address@gmail.com"
$To = "the-destination-user@domain.com"
$Subject = "Alert !!! Detected login into your server"
$Body = (echo "User $env:UserName login into your server "$((Get-Date).ToString())) -Join ''

# The password is an app-specific password if you have 2-factor-auth enabled
$Password = "app-specific-password-here" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password
Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -port 587 -UseSsl -Credential $Credential