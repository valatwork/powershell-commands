$userName="LynneR@contoso.com"
$roleName="Teams Service Administrator"
$role = Get-AzureADDirectoryRole | Where {$_.displayName -eq $roleName}

Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId (Get-AzureADUser | Where {$_.UserPrincipalName -eq $userName}).ObjectID
