$exception=('user1','user2')

Get-CimInstance -ClassName Win32_UserProfile | Where-Object {  [string]$_.LocalPath.split('\')[-2] -eq 'Users' -and [string]$_.Loaded -eq "False" -and [string]$_.LocalPath.split('\')[-1] -notin $exception } | Remove-CimInstance
#
#Sometimes a computer shared with multiple users have memory flooded and/or have a expressive consume of storage space.
#In this moment it's good to clean OS cache.
#The above script erase all data of an user which is not in the $exception list and a user which is not logged in machine.
#