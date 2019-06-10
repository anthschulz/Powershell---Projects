#Creating Get-WinEvent Queries With FilterHashtable
Get-EventLog -LogName Application | Where-Object Source -Match defrag #> Read Note 1
Get-WinEvent -LogName Application | Where-Object { $_.ProviderName -Match 'defrag' }

<#
    https://docs.microsoft.com/en-us/powershell/scripting/samples/creating-get-winevent-queries-with-filterhashtable?view=powershell-6
    Accesses the event log inside Windows, and selects the application logs. The where clause selects from the source and matches with any string with Degfrag

#>

#Building A query with a hash tabe:
# These commands only Work in admin mode only! 
Get-WinEvent -FilterHashtable @{
    LogName='Application'
    ProviderName='.NET Runtime'
 }

 Get-WinEvent -FilterHashtable @{
    LogName='Application'
    ProviderName='*defrag'
 }