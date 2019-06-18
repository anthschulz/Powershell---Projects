###############################
###### PowerShell Basics ######
###############################

Get-Verb
Get-Verb -verb S* # -- Grabs all the verbs with S
# Checks the get service, names for all processes with M against the computer name DESKTOP-FL9B54Q
Get-Service -Name M* -ComputerName DESKTOP-FL9B54Q 
gsv -Name M* -ComputerName DESKTOP-FL9B54Q # -- Shorted version gsv is a short form for get-service
Get-Help | more # -- to view the help file for the command