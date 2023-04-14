Get-CimInstance -ClassName Win32_UserProfile -ComputerName localhost # retrieve the user profiles on the target machine

# remove the specified user on the local machine
Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -eq 'UserA' } | Remove-CimInstance

# remove the specified user on the target remote machines
Get-CimInstance -ComputerName SRV1,SRV2,SRV3 -Class Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -eq 'UserA' } | Remove-CimInstance
