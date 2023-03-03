# Import AD module for cmdlets
Import-Module activedirectory

# Set variable
$Users = Import-csv C:\Users\Administrator\Documents\Test\users1.csv

# CSV file variables and loop through details
foreach ($User in $Users) 
{
    $Username = $User.SamAccountName

# If user already exists
if (Get-ADUser -F {SamAccountName -eq $Username})
    {
        Write-Warning "A user with this username $Username already exists." }

# If user does not exist
        else {
            $details = @{
                Name = $User.FullName
                Givenname = $User.First
                Surname = $User.Last
                Title = $User.Title
                Department = $User.Department
                SamAccountName = $User.SamAccountName
                DisplayName = $User.UserName
                Email = $User.Email
                Street = $User.Street
                City = $User.City
                State = $User.State
                PostalCode = $User.Zip
                ChangePasswordAtLogon = $True 
            } #end details
            New-ADUser @details
        }
}