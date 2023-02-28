# Import AD module for cmdlets
Import-Module activedirectory

# Set variable
$Users = Import-csv <filepath>

# CSV file variables and loop through details
foreach ($User in $Users) 
{
$LastName = $User.lastname
$FirstName = $User.firstname
$Title = $User.jobtitle
$Department = $User.department
$OU = $User.ou
$UserName = $User.username
$Email = $User.email
$Phone = $User.telephonenumber
$Street = $User.streetaddress
$City = $User.city
$State = $User.state
$Zip = $User.zip

# If user already exists
if (Get-ADUser -F {SamAccountName -eq $UserName})
    {
        Write-Warning "A user with this username $UserName already exists." }

# If user does not exist
        else {
            New-ADUser 
            $details = @{
            FirstName = $FirstName
            LastName = $LastName
            DisplayName = "$FirstName $LastName" 
            JobTitle = $Title
            Department = $Department
            Path = $OU
            SamAccountName = $UserName 
            UserPrincipalName = "$UserName@corp.globexpower.com"
            Email = $Email
            Telephone = $Phone
            Street = $Street
            City = $City
            State = $State
            Zip = $Zip
            ChangePasswordAtLogon = $True 
            } #end details
        }
}