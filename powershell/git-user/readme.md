# git-user


1. Import the module in your `Profile.ps1`:

```PowerShell
Import-Module -Name "C:\_repos\daily-scripts\powershell\gitUsers.ps1"
```

2. Set an alias for the function:

> This step is optional.

```PowerShell
New-Alias -Name git-user Set-GitUser
```

## Usage

### Set git user name and email in global scope

```PowerShell
git-user "user name" "user@email.com"
```

### Set git user name and email for a single repository

```PowerShell
# Current repository as context
git-user "user name" "user@email.com" "."

# Specific repo
git-user "user name" "user@email.com" "C:/repos/example"
```