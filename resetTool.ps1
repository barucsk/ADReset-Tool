while(0 -lt 1)
{
    $user = Read-Host "Enter username"
    $userData = net user $user /domain
    Write-Host $userData[10]
    Write-Host $userData[11]
    Write-Host $userData[7]
    if($userData[7] -like "*Locked")
    {
        $temp = net user $user /domain /active:yes
        Write-Host "The account has been unlocked successfully"
    }
    $reset = Read-Host "Do you want to reset the password? Press Y or N"
    if($reset -eq "y")
    {
        $pass = Read-Host "Enter new password"
        $userData = net user $user $pass /domain
        Write-Host "Password changed successfully"
    }
    Write-Host "***************************************************"
}