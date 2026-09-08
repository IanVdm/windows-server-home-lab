# PowerShell Active Directory User Creation

## Objective
Automate the creation of AD users using PowerShell, including placing users in the correct OU and adding them to a security group.

## Environment
|Component|Configuration|
|---------|-------------|
|Domain|```lab.home.arpa```|
|Domain Controller|```DC01```|
|Target OU|```IT```|
|Editor|```PowerShell ISE```|

## Configuration
Created a single AD user with ```New-ADUser``` and added the user to ```IT-Staff``` using ```Add-ADGroupMember```.

Variables were then introduced to make the commands reusable.

The process was extended to use a CSV file containing user information.

FirstName,LastName,Username
Bob,Jones,bob.jones
Koos,de Groot,koos.degroot
Lucy,Smith,lucy.smith

```Import-Csv``` and a ```foreach``` loop was used to process each user and error handling was added using ```try/catch``` and ```-ErrorAction Stop```.

## Verification
Users were verifeid with:

```Get-ADUser -Identity "username"```

Group membership was verified with:

```Get-ADGroupMember -Identity "IT-Staff"```

The users were confirmed to be created and placed in the correct OU and security group.

## Result
Created a PowerShell user creation script that can create multiple AD users from a CSV file and add them to the appropriate security group.

![Script](../../Screenshots/User%20creation%20script.PNG)