$emails = Get-Mailbox | Select-Object Alias
$users = Get-Mailbox | Select-Object Alias

$emails | foreach {
    if($_.Alias -ne "Larry" -or $_.Alias -ne "ShainaC" -or $_.Alias -ne "SteveD")
    {
        $identity = $_.Alias
        $calendar = $identity + ":\calendar"
        Write-Host $calendar
        $users | foreach {
        if ($_.Alias -ne $identity) {
        Write-Host $_.Alias
        Add-MailboxFolderPermission -Identity $calendar -User $_.Alias -AccessRights Reviewer
        }
        }
    }
    else
    {
    continue
    }
}

