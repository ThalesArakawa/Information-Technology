To interact with Active Directory we need of two features:
    - RSAT Active Directory PAckage
    - Active Directory Module

To get them, just run:

    Add-WindowsCapability -Name 'Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0' -Online

and

    Import-Module ActiveDirectory