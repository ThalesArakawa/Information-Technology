#Here we have a CSV file which contains info about users
#For the use of Get-ADUser in this script we have the following syntax:
#
#   Get-ADUser -Identity <Identity> -Properties [<Properties>]
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
#This line import a CSV file with UTF8 Encoding.
$csv = Import-Csv -Path .\csv\users.csv -Encoding UTF8 
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
#In this example we get all possibly information in Active Directory about user.
#For each object(row) in users.csv the retrieved info is appended in anoter file.
#The UseQuotes parameter it's exclusive for PowerShell 7 (https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3&viewFallbackFrom=powershell-7&WT.mc_id=THOMASMAURER-blog-thmaure)
$csv | ForEach-Object {

    $userInfo=Get-ADUser -Identity $_.Identity -Properties *

    $newRow = [PSCustomObject]@{
        "AccountExpirationDate" = $userInfo.AccountExpirationDate;
        "accountExpires" = $userInfo.accountExpires;
        "AccountLockoutTime" = $userInfo.AccountLockoutTime;
        "AccountNotDelegated" = $userInfo.AccountNotDelegated;
        "adminCount" = $userInfo.adminCount;
        "AllowReversiblePasswordEncryption" = $userInfo.AllowReversiblePasswordEncryption;
        "AuthenticationPolicy" = $userInfo.AuthenticationPolicy;
        "AuthenticationPolicySilo" = $userInfo.AuthenticationPolicySilo;
        "BadLogonCount" = $userInfo.BadLogonCount;
        "badPasswordTime" = $userInfo.badPasswordTime;
        "badPwdCount" = $userInfo.badPwdCount;
        "CannotChangePassword" = $userInfo.CannotChangePassword;
        "CanonicalName" = $userInfo.CanonicalName;
        "Certificates" = $userInfo.Certificates;
        "City" = $userInfo.City;
        "CN" = $userInfo.CN;
        "codePage" = $userInfo.codePage;
        "Company" = $userInfo.Company;
        "CompoundIdentitySupported" = $userInfo.CompoundIdentitySupported;
        "Country" = $userInfo.Country;
        "countryCode" = $userInfo.countryCode;
        "Created" = $userInfo.Created;
        "createTimeStamp" = $userInfo.createTimeStamp;
        "Deleted" = $userInfo.Deleted;
        "Department" = $userInfo.Department;
        "Description" = $userInfo.Description;
        "DisplayName" = $userInfo.DisplayName;
        "DistinguishedName" = $userInfo.DistinguishedName;
        "Division" = $userInfo.Division;
        "DoesNotRequirePreAuth" = $userInfo.DoesNotRequirePreAuth;
        "dSCorePropagationData" = $userInfo.dSCorePropagationData;
        "EmailAddress" = $userInfo.EmailAddress;
        "EmployeeID" = $userInfo.EmployeeID;
        "EmployeeNumber" = $userInfo.EmployeeNumber;
        "Enabled" = $userInfo.Enabled;
        "Fax" = $userInfo.Fax;
        "GivenName" = $userInfo.GivenName;
        "HomeDirectory" = $userInfo.HomeDirectory;
        "HomedirRequired" = $userInfo.HomedirRequired;
        "HomeDrive" = $userInfo.HomeDrive;
        "HomePage" = $userInfo.HomePage;
        "HomePhone" = $userInfo.HomePhone;
        "Initials" = $userInfo.Initials;
        "instanceType" = $userInfo.instanceType;
        "isDeleted" = $userInfo.isDeleted;
        "KerberosEncryptionType" = $userInfo.KerberosEncryptionType;
        "LastBadPasswordAttempt" = $userInfo.LastBadPasswordAttempt;
        "LastKnownParent" = $userInfo.LastKnownParent;
        "lastLogon" = $userInfo.lastLogon;
        "LastLogonDate" = $userInfo.LastLogonDate;
        "lastLogonTimestamp" = $userInfo.lastLogonTimestamp;
        "LockedOut" = $userInfo.LockedOut;
        "logonCount" = $userInfo.logonCount;
        "logonHours" = $userInfo.logonHours;
        "LogonWorkstations" = $userInfo.LogonWorkstations;
        "Manager" = $userInfo.Manager;
        "MemberOf" = $userInfo.MemberOf;
        "MNSLogonAccount" = $userInfo.MNSLogonAccount;
        "MobilePhone" = $userInfo.MobilePhone;
        "Modified" = $userInfo.Modified;
        "modifyTimeStamp" = $userInfo.modifyTimeStamp;
        "msDS-SupportedEncryptionTypes" = $userInfo.'msDS-SupportedEncryptionTypes';
        "msDS-User-Account-Control-Computed" = $userInfo.'msDS-User-Account-Control-Computed';
        "Name" = $userInfo.Name;
        "nTSecurityDescriptor" = $userInfo.nTSecurityDescriptor;
        "ObjectCategory" = $userInfo.ObjectCategory;
        "ObjectClass" = $userInfo.ObjectClass;
        "ObjectGUID" = $userInfo.ObjectGUID;
        "objectSid" = $userInfo.objectSid;
        "Office" = $userInfo.Office;
        "OfficePhone" = $userInfo.OfficePhone;
        "Organization" = $userInfo.Organization;
        "OtherName" = $userInfo.OtherName;
        "PasswordExpired" = $userInfo.PasswordExpired;
        "PasswordLastSet" = $userInfo.PasswordLastSet;
        "PasswordNeverExpires" = $userInfo.PasswordNeverExpires;
        "PasswordNotRequired" = $userInfo.PasswordNotRequired;
        "physicalDeliveryOfficeName" = $userInfo.physicalDeliveryOfficeName;
        "POBox" = $userInfo.POBox;
        "PostalCode" = $userInfo.PostalCode;
        "PrimaryGroup" = $userInfo.PrimaryGroup;
        "primaryGroupID" = $userInfo.primaryGroupID;
        "PrincipalsAllowedToDelegateToAccount" = $userInfo.PrincipalsAllowedToDelegateToAccount;
        "ProfilePath" = $userInfo.ProfilePath;
        "ProtectedFromAccidentalDeletion" = $userInfo.ProtectedFromAccidentalDeletion;
        "pwdLastSet" = $userInfo.pwdLastSet;
        "SamAccountName" = $userInfo.SamAccountName;
        "sAMAccountType" = $userInfo.sAMAccountType;
        "ScriptPath" = $userInfo.ScriptPath;
        "sDRightsEffective" = $userInfo.sDRightsEffective;
        "ServicePrincipalNames" = $userInfo.ServicePrincipalNames;
        "SID" = $userInfo.SID;
        "SIDHistory" = $userInfo.SIDHistory;
        "SmartcardLogonRequired" = $userInfo.SmartcardLogonRequired;
        "sn" = $userInfo.sn;
        "State" = $userInfo.State;
        "StreetAddress" = $userInfo.StreetAddress;
        "Surname" = $userInfo.Surname;
        "Title" = $userInfo.Title;
        "TrustedForDelegation" = $userInfo.TrustedForDelegation;
        "TrustedToAuthForDelegation" = $userInfo.TrustedToAuthForDelegation;
        "UseDESKeyOnly" = $userInfo.UseDESKeyOnly;
        "userAccountControl" = $userInfo.userAccountControl;
        "userCertificate" = $userInfo.userCertificate;
        "UserPrincipalName" = $userInfo.UserPrincipalName;
        "uSNChanged" = $userInfo.uSNChanged;
        "uSNCreated" = $userInfo.uSNCreated;
        "whenChanged" = $userInfo.whenChanged;
        "whenCreated" = $userInfo.whenCreated;
    }

    Export-Csv -InputObject $newRow -Path .\csv\usersInfo.csv -Append -NoTypeInformation -UseQuotes Never

}