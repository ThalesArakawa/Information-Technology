#
#From a CSV file with list of IP's, we can transfer, delete and overwrite files and folders
#
#The CSV file with IP Addresses
$csv = Import-CSV -Path '.\csv\ips.csv' -Encoding UTF8
#
#The file to be shared
$filePath='.\example.txt'
#
#Sending files to all listed IPAddress
$csv | Foreach-object {

    Copy-Item -Path $filePath -Destination ('\\'+($_.IP)+'\c$\DestinationPath\')

}
#
#If u want to send a folder
$folderPath='.\folderExample'
#
#Sending folder and all of content to all listed IPAddress
$csv | Foreach-object {

    Copy-Item -Path $folderPath -Destination ('\\'+($_.IP)+'\c$\DestinationPath\') -Recurse -Force

}