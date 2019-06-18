#######################################
######Introduction to PowerShell#######
#######################################

#Gathering information using the powershell
#Creating a report in a .csv format using the powershell shell

get-services #Shows all the services that are current running stopped|started|restarting
Get-Service | Where-Object Status -eq 'Stopped' #gets the services and added a condition to select from the status where it equals Stopped
get-services | Where-Object name -eq "Asus" #same as above but grabs from the name column

#Creating a CSV File with the above commands:
Get-Service | Where-Object Status -eq 'Stopped' | Export-Csv C:\Users\schul\Desktop\services.csv
Get-Service | Where-Object Status -eq 'Stopped' | Select-Object name, status, DisplayName | Export-Csv C:\Users\schul\Desktop\services.csv

#Demo Course Enviroment:
$PSVersionTable # -- Shows the powershell version information

#Remote Tools to use administrative console to manage server
https://www.microsoft.com/en-us/download/details.aspx?id=45520 # -- Link to download the RSAT tools for Windows 10