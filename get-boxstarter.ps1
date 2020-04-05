Set-ExecutionPolicy Unrestricted -Force;
. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force;
