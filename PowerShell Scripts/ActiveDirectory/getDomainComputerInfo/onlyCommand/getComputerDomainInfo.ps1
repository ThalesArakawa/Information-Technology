#For the use of Get-ADComputer in this script we have the following PowerShell Expression Language syntax:
#
#   Get-ADComputer -Filter 'Name -like "*"'
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
#This line get the computers which match a generic wildcard. In this case, all computers.
$computers = Get-ADComputer -Filter 'Name -like "*"'
#
#
#
#After, just apply a loop syntax and the command to export to a csv
#The UseQuotes parameter it's exclusive for PowerShell 7 (https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3&viewFallbackFrom=powershell-7&WT.mc_id=THOMASMAURER-blog-thmaure)
$computers | ForEach-Object {

    $newRow = [PSCustomObject]@{
        "AccountExpirationDate" = $_.AccountExpirationDate;
        "accountExpires" = $_.accountExpires;
        "AccountLockoutTime" = $_.AccountLockoutTime;
        "AccountNotDelegated" = $_.AccountNotDelegated;
        "AllowReversiblePasswordEncryption" = $_.AllowReversiblePasswordEncryption;
        "AuthenticationPolicy" = $_.AuthenticationPolicy;
        "AuthenticationPolicySilo" = $_.AuthenticationPolicySilo;
        "BadLogonCount" = $_.BadLogonCount;
        "badPasswordTime" = $_.badPasswordTime;
        "badPwdCount" = $_.badPwdCount;
        "CannotChangePassword" = $_.CannotChangePassword;
        "CanonicalName" = $_.CanonicalName;
        "Certificates" = $_.Certificates;
        "CN" = $_.CN;
        "codePage" = $_.codePage;
        "CompoundIdentitySupported" = $_.CompoundIdentitySupported;
        "countryCode" = $_.countryCode;
        "Created" = $_.Created;
        "createTimeStamp" = $_.createTimeStamp;
        "Deleted" = $_.Deleted;
        "Description" = $_.Description;
        "DisplayName" = $_.DisplayName;
        "DistinguishedName" = $_.DistinguishedName;
        "DNSHostName" = $_.DNSHostName;
        "DoesNotRequirePreAuth" = $_.DoesNotRequirePreAuth;
        "dSCorePropagationData" = $_.dSCorePropagationData;
        "Enabled" = $_.Enabled;
        "HomedirRequired" = $_.HomedirRequired;
        "HomePage" = $_.HomePage;
        "instanceType" = $_.instanceType;
        "IPv4Address" = $_.IPv4Address;
        "IPv6Address" = $_.IPv6Address;
        "isCriticalSystemObject" = $_.isCriticalSystemObject;
        "isDeleted" = $_.isDeleted;
        "KerberosEncryptionType" = $_.KerberosEncryptionType;
        "LastBadPasswordAttempt" = $_.LastBadPasswordAttempt;
        "LastKnownParent" = $_.LastKnownParent;
        "lastLogoff" = $_.lastLogoff;
        "lastLogon" = $_.lastLogon;
        "LastLogonDate" = $_.LastLogonDate;
        "lastLogonTimestamp" = $_.lastLogonTimestamp;
        "localPolicyFlags" = $_.localPolicyFlags;
        "Location" = $_.Location;
        "LockedOut" = $_.LockedOut;
        "logonCount" = $_.logonCount;
        "ManagedBy" = $_.ManagedBy;
        "MemberOf" = $_.MemberOf;
        "MNSLogonAccount" = $_.MNSLogonAccount;
        "Modified" = $_.Modified;
        "modifyTimeStamp" = $_.modifyTimeStamp;
        "msDS-SupportedEncryptionTypes" = $_.'msDS-SupportedEncryptionTypes';
        "msDS-User-Account-Control-Computed" = $_.'msDS-User-Account-Control-Computed';
        "Name" = $_.Name;
        "nTSecurityDescriptor" = $_.nTSecurityDescriptor;
        "ObjectCategory" = $_.ObjectCategory;
        "ObjectClass" = $_.ObjectClass;
        "ObjectGUID" = $_.ObjectGUID;
        "objectSid" = $_.objectSid;
        "OperatingSystem" = $_.OperatingSystem;
        "OperatingSystemHotfix" = $_.OperatingSystemHotfix;
        "OperatingSystemServicePack" = $_.OperatingSystemServicePack;
        "OperatingSystemVersion" = $_.OperatingSystemVersion;
        "PasswordExpired" = $_.PasswordExpired;
        "PasswordLastSet" = $_.PasswordLastSet;
        "PasswordNeverExpires" = $_.PasswordNeverExpires;
        "PasswordNotRequired" = $_.PasswordNotRequired;
        "PrimaryGroup" = $_.PrimaryGroup;
        "primaryGroupID" = $_.primaryGroupID;
        "PrincipalsAllowedToDelegateToAccount" = $_.PrincipalsAllowedToDelegateToAccount;
        "ProtectedFromAccidentalDeletion" = $_.ProtectedFromAccidentalDeletion;
        "pwdLastSet" = $_.pwdLastSet;
        "SamAccountName" = $_.SamAccountName;
        "sAMAccountType" = $_.sAMAccountType;
        "sDRightsEffective" = $_.sDRightsEffective;
        "ServiceAccount" = $_.ServiceAccount;
        "servicePrincipalName" = $_.servicePrincipalName;
        "ServicePrincipalNames" = $_.ServicePrincipalNames;
        "SID" = $_.SID;
        "SIDHistory" = $_.SIDHistory;
        "TrustedForDelegation" = $_.TrustedForDelegation;
        "TrustedToAuthForDelegation" = $_.TrustedToAuthForDelegation;
        "UseDESKeyOnly" = $_.UseDESKeyOnly;
        "userAccountControl" = $_.userAccountControl;
        "userCertificate" = $_.userCertificate;
        "UserPrincipalName" = $_.UserPrincipalName;
        "uSNChanged" = $_.uSNChanged;
        "uSNCreated" = $_.uSNCreated;
        "whenChanged" = $_.whenChanged;
        "whenCreated" = $_.whenCreated;
    }

    Export-Csv -InputObject $newRow -Path .\csv\computersInfo.csv -Append -NoTypeInformation -UseQuotes Never

}