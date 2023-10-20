#
#We need to define the OU destiny
#
#If u don't know the distinguished name of your Organizational Unit, you can run:
#
#   Get-ADOrganizationalUnit -Filter 'name -like "*"' -Properties *
#
#and analyze the results
#
$targetPath = 'OU=ExampleUnit,DC=example,DC=domain'
#
#We need to define the objects which will be moved
#I like of CSV file
#
$csv=Import-CSV -Path '.\csv\adObject.csv' -Encoding UTF8
#
#
#
$csv | ForEach-Object {

    Move-ADObject -Identity $_.Identity -TargetPath $targetPath

}
#
#Remeber. ADObject can represent a users, computers, phone, printers and etc
#