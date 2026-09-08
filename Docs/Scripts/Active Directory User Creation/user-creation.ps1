$CsvPath = "C:\Path to CSV"
$TargetOU = "OU=IT,OU=Departments,DC=lab,DC=home,DC=arpa"
$TargetGroup = "IT-Staff"
$Domain = "lab.home.arpa"

# Import Active Directory module
Import-Module ActiveDirectory

# Import users from CSV
$Users = Import-Csv $CsvPath

# Process each user
foreach ($User in $Users) {

  $Username = $User.Username

  # Check whether the user already exists
  if (Get-ADUser -Identity $Username -ErrorAction SilentlyContinue) {
    Write-Host "User $Username already exists. Skipping."
  } else {
    try {
      # Create the user
      New-ADUser `
        -Name "$($User.FirstName) $($User.LastName)" `
        -GivenName $User.FirstName `
        -Surname $User.LastName `
        -SamAccountName $Username `
        -UserPrincipalName "$Username@$Domain" `
        -Path $TargetOU `
        -AccountPassword (Read-Host -AsSecureString "Enter password for $Username") `
        -Enabled $true `
        -ErrorAction Stop

      # Add user to security group
      Add-ADGroupMember `
        -Identity $TargetGroup `
        -Members $Username `
        -ErrorAction Stop

      Write-Host "User $Username created and added to $TargetGroup."

    } catch {
      Write-Host "Error processing $Username : $($_.Exception.Message)"
    }
  }
}