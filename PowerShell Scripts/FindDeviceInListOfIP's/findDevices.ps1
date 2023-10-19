$csvPath = '.\csv\ip.csv'
$csv = Import-Csv -Path $csvPath -Encoding UTF8 

$csv | ForEach-Object {

    $filter='IPv4Addres -eq "'+$_.IP+'"'
    Write-Host $filter
    
    try {
        #Only Native PowerShell
        #$_.Disco = (Get-WmiObject -ComputerName (Get-ADComputer -Filter $filter) -Class Win32_DiskDrive).Model 
        $_.Disco = (Get-CimInstance -ComputerName (Get-ADComputer -Filter $filter) -Class Win32_DiskDrive).Model
    }
    catch {
        $_.Disco = "Sem Resposta"
    }

}

for($i = 0 ; $i -lt $sources.count ; $i++){

    $csv | ForEach-Object {
        Write-Host $_.Hostname
        try {
            $_.Disco = (Get-WmiObject -ComputerName $_.Hostname -Class Win32_DiskDrive).Model
        }
        catch {
            $_.Disco = "Sem Resposta"
        }
    }

    $csv | Export-Csv -Path $sources[$i].PSPath -NoTypeInformation

}