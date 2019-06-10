#Changing Computer State:
#https://docs.microsoft.com/en-us/powershell/scripting/samples/changing-computer-state?view=powershell-6
rundll32.exe user32.dll,LockWorkStation #Used to lock the computer
shutdown.exe -l #legacy command that is used in CMD/PS to log off session
Stop-Computer #will shutdown the computer
Restart-Computer #will reboot the computer 
Restart-Computer -Force #will reboot the computer right away and will not wait to save stuff

#Collecting Information About Computers:
#https://docs.microsoft.com/en-us/powershell/scripting/samples/collecting-information-about-computers?view=powershell-6

Get-CimInstance -ClassName Win32_Desktop -ComputerName
#class name is defined by the computer, and be looked up using the command get-cimclass
Get-CimClass #will show you all the classes

#how to get the computer Name:
$env:COMPUTERNAME
#OR Alternative way to get the hostname
HOSTNAME.EXE

#listing BIOS Information and Listing Processor Information:
Get-CimInstance -ClassName Win32_BIOS #shows bios information of the computer
Get-CimInstance -ClassName Win32_BIOS | Select-Object "Name" #grabs a string with the word name

#Listing Processor Information:
Get-CimInstance -ClassName Win32_Processor

<#
    DeviceID Name                                     Caption                                MaxClockSpeed SocketDesignation Manufacturer
-------- ----                                     -------                                ------------- ----------------- ------------
CPU0     Intel(R) Core(TM) i9-9900K CPU @ 3.60GHz Intel64 Family 6 Model 158 Stepping 12 3600          LGA1151           GenuineIntel
Example of the output from the Command Get-CimInstance -ClassName Win32_Processor -ComputerName 

Need to figure out what the heck -computerName . Switch means. It appears the computer name or ip address doesn't work
#>

#Listing Installed Hotfixes:
Get-CimInstance -ClassName Win32_QuickFixEngineering #Outputs all the most recent hotfixes found on the box
#Also doesn't work with administrator permissions (need to figure out why)
#command Doesn't work
Get-CimInstance -ClassName Win32_QuickFixEngineering -ComputerName . -Property HotFixID
Get-CimInstance -ClassName Win32_QuickFixEngineering -ComputerName .

#Listing Operating System Version Information:
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion
<#
Uses the get-ciminstance to get the operating system information, and then
the select-Object -property command to grab the following buildNmber, buildType,
OSType, ServicePackMajorVersion, ServicePackMinorVersion and out the following information

BuildNumber             : 17763
BuildType               : Multiprocessor Free
OSType                  : 18
ServicePackMajorVersion : 0
ServicePackMinorVersion : 0


#>

#Listing Local User and Owner
get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property NumberOfLicensedUsers #> Shows the number of licensed users on the box
Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property *user* #> uses a wild card to grab all the users, and show the number of users

#Getting Available Disk Space
Get-CimInstance Win32_LogicalDisk #> just shows all your logical drives
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" #> shows the fixed drives that have the wmi value of 3

#Getting Logon Session Information:
Get-CimInstance -ClassName Win32_LogonSession -ComputerName . #> shows the logon session information

#Getting the User Logged on to a Computer
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object "UserName"

#Getting Local Time from a Computer
Get-CimInstance -ClassName Win32_LocalTime #> Gets the local time information for whatever box you target

#Display Service Status:
Get-CimInstance -ClassName Win32_Service #> More detailed command than get-service
Get-CimInstance -ClassName Win32_Service -ComputerName . | Select-Object -Property Status,Name,DisplayName #> used to get the status, name, and display name for services