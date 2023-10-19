#Here we have a CSV file which contains info about computers
#For the use of Get-ADComputer in this script we have the following syntax:
#
#   Get-ADComputer -Identity <Identity> -Properties [<Properties>]
#   Where <Identity> is a unique identification. The accepted atributes are: 
#       - Distinguished Name
#       - ObjectGUID
#       - ObjectSID
#       - sAMAccountName
#
#   Where <Properties> accept a lot of parameters.
#   To see which parameters is valid, use the command with a known computername and properties equal a * (wildcard).
#   This will retrieve all information about the computer in Active Directory
#
#
#This line import a CSV file with UTF8 Encoding.
$csv = Import-Csv -Path .\csv\computers.csv -Encoding UTF8 
#Pay attention in Separator Character and if fields have Quotes to distinguish.
#
#   My CSV file in this example:
#   
#   Identity,Name
#   123456,ALPHA BETA GAMMA
#   789101,DELTA EPSILON ZETA
#
#
#After import just apply a loop syntax and the command to get the info.
#In this example we get all possibly information in Active Directory about computer.
#For each object(row) in computers.csv the retrieved info is appended in anoter file.
#The UseQuotes parameter it's exclusive for PowerShell 7 (https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3&viewFallbackFrom=powershell-7&WT.mc_id=THOMASMAURER-blog-thmaure)
$csv | ForEach-Object {

    $computerInfo=Get-ADComputer -Identity $_.Identity -Properties *

    $newRow = [PSCustomObject]@{
        "AccountExpirationDate" = $computerInfo.AccountExpirationDate;
        "accountExpires" = $computerInfo.accountExpires;
        "AccountLockoutTime" = $computerInfo.AccountLockoutTime;
        "AccountNotDelegated" = $computerInfo.AccountNotDelegated;
        "AllowReversiblePasswordEncryption" = $computerInfo.AllowReversiblePasswordEncryption;
        "AuthenticationPolicy" = $computerInfo.AuthenticationPolicy;
        "AuthenticationPolicySilo" = $computerInfo.AuthenticationPolicySilo;
        "BadLogonCount" = $computerInfo.BadLogonCount;
        "badPasswordTime" = $computerInfo.badPasswordTime;
        "badPwdCount" = $computerInfo.badPwdCount;
        "CannotChangePassword" = $computerInfo.CannotChangePassword;
        "CanonicalName" = $computerInfo.CanonicalName;
        "Certificates" = $computerInfo.Certificates;
        "CN" = $computerInfo.CN;
        "codePage" = $computerInfo.codePage;
        "CompoundIdentitySupported" = $computerInfo.CompoundIdentitySupported;
        "countryCode" = $computerInfo.countryCode;
        "Created" = $computerInfo.Created;
        "createTimeStamp" = $computerInfo.createTimeStamp;
        "Deleted" = $computerInfo.Deleted;
        "Description" = $computerInfo.Description;
        "DisplayName" = $computerInfo.DisplayName;
        "DistinguishedName" = $computerInfo.DistinguishedName;
        "DNSHostName" = $computerInfo.DNSHostName;
        "DoesNotRequirePreAuth" = $computerInfo.DoesNotRequirePreAuth;
        "dSCorePropagationData" = $computerInfo.dSCorePropagationData;
        "Enabled" = $computerInfo.Enabled;
        "HomedirRequired" = $computerInfo.HomedirRequired;
        "HomePage" = $computerInfo.HomePage;
        "instanceType" = $computerInfo.instanceType;
        "IPv4Address" = $computerInfo.IPv4Address;
        "IPv6Address" = $computerInfo.IPv6Address;
        "isCriticalSystemObject" = $computerInfo.isCriticalSystemObject;
        "isDeleted" = $computerInfo.isDeleted;
        "KerberosEncryptionType" = $computerInfo.KerberosEncryptionType;
        "LastBadPasswordAttempt" = $computerInfo.LastBadPasswordAttempt;
        "LastKnownParent" = $computerInfo.LastKnownParent;
        "lastLogoff" = $computerInfo.lastLogoff;
        "lastLogon" = $computerInfo.lastLogon;
        "LastLogonDate" = $computerInfo.LastLogonDate;
        "lastLogonTimestamp" = $computerInfo.lastLogonTimestamp;
        "localPolicyFlags" = $computerInfo.localPolicyFlags;
        "Location" = $computerInfo.Location;
        "LockedOut" = $computerInfo.LockedOut;
        "logonCount" = $computerInfo.logonCount;
        "ManagedBy" = $computerInfo.ManagedBy;
        "MemberOf" = $computerInfo.MemberOf;
        "MNSLogonAccount" = $computerInfo.MNSLogonAccount;
        "Modified" = $computerInfo.Modified;
        "modifyTimeStamp" = $computerInfo.modifyTimeStamp;
        "msDS-SupportedEncryptionTypes" = $computerInfo.'msDS-SupportedEncryptionTypes';
        "msDS-User-Account-Control-Computed" = $computerInfo.'msDS-User-Account-Control-Computed';
        "Name" = $computerInfo.Name;
        "nTSecurityDescriptor" = $computerInfo.nTSecurityDescriptor;
        "ObjectCategory" = $computerInfo.ObjectCategory;
        "ObjectClass" = $computerInfo.ObjectClass;
        "ObjectGUID" = $computerInfo.ObjectGUID;
        "objectSid" = $computerInfo.objectSid;
        "OperatingSystem" = $computerInfo.OperatingSystem;
        "OperatingSystemHotfix" = $computerInfo.OperatingSystemHotfix;
        "OperatingSystemServicePack" = $computerInfo.OperatingSystemServicePack;
        "OperatingSystemVersion" = $computerInfo.OperatingSystemVersion;
        "PasswordExpired" = $computerInfo.PasswordExpired;
        "PasswordLastSet" = $computerInfo.PasswordLastSet;
        "PasswordNeverExpires" = $computerInfo.PasswordNeverExpires;
        "PasswordNotRequired" = $computerInfo.PasswordNotRequired;
        "PrimaryGroup" = $computerInfo.PrimaryGroup;
        "primaryGroupID" = $computerInfo.primaryGroupID;
        "PrincipalsAllowedToDelegateToAccount" = $computerInfo.PrincipalsAllowedToDelegateToAccount;
        "ProtectedFromAccidentalDeletion" = $computerInfo.ProtectedFromAccidentalDeletion;
        "pwdLastSet" = $computerInfo.pwdLastSet;
        "SamAccountName" = $computerInfo.SamAccountName;
        "sAMAccountType" = $computerInfo.sAMAccountType;
        "sDRightsEffective" = $computerInfo.sDRightsEffective;
        "ServiceAccount" = $computerInfo.ServiceAccount;
        "servicePrincipalName" = $computerInfo.servicePrincipalName;
        "ServicePrincipalNames" = $computerInfo.ServicePrincipalNames;
        "SID" = $computerInfo.SID;
        "SIDHistory" = $computerInfo.SIDHistory;
        "TrustedForDelegation" = $computerInfo.TrustedForDelegation;
        "TrustedToAuthForDelegation" = $computerInfo.TrustedToAuthForDelegation;
        "UseDESKeyOnly" = $computerInfo.UseDESKeyOnly;
        "userAccountControl" = $computerInfo.userAccountControl;
        "userCertificate" = $computerInfo.userCertificate;
        "UserPrincipalName" = $computerInfo.UserPrincipalName;
        "uSNChanged" = $computerInfo.uSNChanged;
        "uSNCreated" = $computerInfo.uSNCreated;
        "whenChanged" = $computerInfo.whenChanged;
        "whenCreated" = $computerInfo.whenCreated;
    }

    Export-Csv -InputObject $newRow -Path .\csv\computersInfo.csv -Append -NoTypeInformation -UseQuotes Never

}