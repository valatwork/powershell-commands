if($AADConnection.Account -eq $null){
     $AADConnection = Connect-AzureAD
}

$hostname = Read-Host "Please enter the hostname:"
$device_id = Get-AzureADDevice -SearchString "$hostname" | Select-Object -Property DeviceId
#    Write-Host $device_id
$group_name =  Read-Host "Please enter the group name:"
$group_id = Get-AzureADGroup -SearchString $group_name | Select-Object -Property RefObjectId
#    Write-Host $group_id  
Write-Host "$hostname will be added to $group_name" 

$choice = Read-Host -Prompt "[y/n]"
$nopenopenope = Write-Host "Operation canceled"
$done = Write-Host "Done!"
$ohnoes = Write-Host "something went wrong"   

if ($choice -match "[yY]"){
Add-AzureADGroupMember -ObjectId $device_id -RefObjectId $group_id
     if(Get-AzureADGroupMember -ObjectId $group_id | Where-Object {$_.DisplayName -eq $hostname}){
                       $done
                    }else 
                         { $ohnoes          
     }else { $nopenopenope
               }
} 
