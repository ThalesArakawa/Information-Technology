$csvPath = '.\csv\ip.csv'
$csv = Import-Csv -Path $csvPath -Encoding UTF8 
#
#Here we have the format of CSV file
#
#   IP,Disk
#   12.123.123.0,
#   12.123.123.1,
#
#The objetive of this script is find a specifif device by any characteristic. Specifically, here, the disk model.
#Get-CimInstance have the Class parameter. This is about WMI/CIM classes and his methods.
#OBS: To see all classes just run Get-CimClass.
#
$csv | ForEach-Object {
#
#It's important to emphasize the need of the computers to be included in domain to this command works
#
    $filter='IPv4Addres -eq "'+$_.IP+'"'
    Write-Host $filter
    
    try {
        #Only Native PowerShell
        #$_.Disco = (Get-WmiObject -ComputerName (Get-ADComputer -Filter $filter) -Class Win32_DiskDrive).Model 
        #PowerShell 7
        $_.Disco = (Get-CimInstance -ComputerName (Get-ADComputer -Filter $filter) -Class Win32_DiskDrive).Model
    }
    catch {
        $_.Disco = "Sem Resposta"
    }

}

$csv | Export-Csv -Path $csvPath -Encoding utf8 -NoTypeInformation -UseQuotes Never -Force