#For the use of Get-ADUser in this script we have the following PowerShell Expression Language syntax:
#
#   Get-ADUser -Filter 'Name -like "*"'
#   Where <Identity> is a unique identification. The accepted atributes are: 
#       - Distinguished Name
#       - ObjectGUID
#       - ObjectSID
#       - sAMAccountName
#
#   Where <Properties> accept a lot of parameters.
#   To see which parameters is valid, use the command with a known username and properties equal a * (wildcard).
#   This will retrieve all information about the user in Active Directory
#
#
#This line get the users which match a generic wildcard. In this case, all users.
$users = Get-ADUser -Filter 'Name -like "*"'
#
#
#
#After, just apply a loop syntax and the command to export to a csv
#The UseQuotes parameter it's exclusive for PowerShell 7 (https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3&viewFallbackFrom=powershell-7&WT.mc_id=THOMASMAURER-blog-thmaure)
$users | ForEach-Object {

    $newRow = [PSCustomObject]@{
        "AccountExpirationDate" = $_.AccountExpirationDate;
        "accountExpires" = $_.accountExpires;
        "AccountLockoutTime" = $_.AccountLockoutTime;
        "AccountNotDelegated" = $_.AccountNotDelegated;
        "adminCount" = $_.adminCount;
        "AllowReversiblePasswordEncryption" = $_.AllowReversiblePasswordEncryption;
        "AuthenticationPolicy" = $_.AuthenticationPolicy;
        "AuthenticationPolicySilo" = $_.AuthenticationPolicySilo;
        "BadLogonCount" = $_.BadLogonCount;
        "badPasswordTime" = $_.badPasswordTime;
        "badPwdCount" = $_.badPwdCount;
        "CannotChangePassword" = $_.CannotChangePassword;
        "CanonicalName" = $_.CanonicalName;
        "Certificates" = $_.Certificates;
        "City" = $_.City;
        "CN" = $_.CN;
        "codePage" = $_.codePage;
        "Company" = $_.Company;
        "CompoundIdentitySupported" = $_.CompoundIdentitySupported;
        "Country" = $_.Country;
        "countryCode" = $_.countryCode;
        "Created" = $_.Created;
        "createTimeStamp" = $_.createTimeStamp;
        "Deleted" = $_.Deleted;
        "Department" = $_.Department;
        "Description" = $_.Description;
        "DisplayName" = $_.DisplayName;
        "DistinguishedName" = $_.DistinguishedName;
        "Division" = $_.Division;
        "DoesNotRequirePreAuth" = $_.DoesNotRequirePreAuth;
        "dSCorePropagationData" = $_.dSCorePropagationData;
        "EmailAddress" = $_.EmailAddress;
        "EmployeeID" = $_.EmployeeID;
        "EmployeeNumber" = $_.EmployeeNumber;
        "Enabled" = $_.Enabled;
        "Fax" = $_.Fax;
        "GivenName" = $_.GivenName;
        "HomeDirectory" = $_.HomeDirectory;
        "HomedirRequired" = $_.HomedirRequired;
        "HomeDrive" = $_.HomeDrive;
        "HomePage" = $_.HomePage;
        "HomePhone" = $_.HomePhone;
        "Initials" = $_.Initials;
        "instanceType" = $_.instanceType;
        "isDeleted" = $_.isDeleted;
        "KerberosEncryptionType" = $_.KerberosEncryptionType;
        "LastBadPasswordAttempt" = $_.LastBadPasswordAttempt;
        "LastKnownParent" = $_.LastKnownParent;
        "lastLogon" = $_.lastLogon;
        "LastLogonDate" = $_.LastLogonDate;
        "lastLogonTimestamp" = $_.lastLogonTimestamp;
        "LockedOut" = $_.LockedOut;
        "logonCount" = $_.logonCount;
        "logonHours" = $_.logonHours;
        "LogonWorkstations" = $_.LogonWorkstations;
        "Manager" = $_.Manager;
        "MemberOf" = $_.MemberOf;
        "MNSLogonAccount" = $_.MNSLogonAccount;
        "MobilePhone" = $_.MobilePhone;
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
        "Office" = $_.Office;
        "OfficePhone" = $_.OfficePhone;
        "Organization" = $_.Organization;
        "OtherName" = $_.OtherName;
        "PasswordExpired" = $_.PasswordExpired;
        "PasswordLastSet" = $_.PasswordLastSet;
        "PasswordNeverExpires" = $_.PasswordNeverExpires;
        "PasswordNotRequired" = $_.PasswordNotRequired;
        "physicalDeliveryOfficeName" = $_.physicalDeliveryOfficeName;
        "POBox" = $_.POBox;
        "PostalCode" = $_.PostalCode;
        "PrimaryGroup" = $_.PrimaryGroup;
        "primaryGroupID" = $_.primaryGroupID;
        "PrincipalsAllowedToDelegateToAccount" = $_.PrincipalsAllowedToDelegateToAccount;
        "ProfilePath" = $_.ProfilePath;
        "ProtectedFromAccidentalDeletion" = $_.ProtectedFromAccidentalDeletion;
        "pwdLastSet" = $_.pwdLastSet;
        "SamAccountName" = $_.SamAccountName;
        "sAMAccountType" = $_.sAMAccountType;
        "ScriptPath" = $_.ScriptPath;
        "sDRightsEffective" = $_.sDRightsEffective;
        "ServicePrincipalNames" = $_.ServicePrincipalNames;
        "SID" = $_.SID;
        "SIDHistory" = $_.SIDHistory;
        "SmartcardLogonRequired" = $_.SmartcardLogonRequired;
        "sn" = $_.sn;
        "State" = $_.State;
        "StreetAddress" = $_.StreetAddress;
        "Surname" = $_.Surname;
        "Title" = $_.Title;
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

    Export-Csv -InputObject $newRow -Path .\csv\usersInfo.csv -Append -NoTypeInformation -UseQuotes Never

}