# Import AD module for cmdlets
Import-Module activedirectory

# Set variable
$Users = Import-csv <filepath>

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
            New-ADUser -Name "$($user.First) $($user.Last)"
            $details = @{
                FirstName = $User.First
                LastName = $User.Last
                JobTitle = $User.Title
                Department = $User.Department
                OU = $User.OU
                Username = $User.UserName
                Email = $User.Email
                Telephone = $User.Phone
                Street = $User.Street
                City = $User.City
                State = $User.State
                Zip = $User.Zip
                ChangePasswordAtLogon = $True 
            } #end details
        }
}