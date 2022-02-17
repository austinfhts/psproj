Connect-MgGraph -Scopes UserAuthenticationMethod.ReadWrite.All
Select-MgProfile -Name beta

Import-CSV "C:\Users\AustinF.LBANET\Documents\mfasetup.csv" |ForEach-Object {
$email = $_.Email
$mobile = $_.Mobile
$formatted = "+1 " + $mobile
New-MgUserAuthenticationPhoneMethod -UserId $email -PhoneType "mobile" -PhoneNumber $formatted
}