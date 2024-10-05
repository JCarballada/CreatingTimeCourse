
# PowerShell Cmdlets 101: Get-Command and Friends

## Introduction to Get-Command

The first amigo in our PowerShell journey is: `Get-Command`.

PowerShell cmdlets follow a consistent Verb-Noun syntax. This consistency makes it easier to:
- Predict how a command you need might look
- Transition between different PowerShell-supported products
- Find cmdlets more intuitively than navigating through a GUI

## Exploring Get-Command

Let's dive into `Get-Command`:

```powershell
Get-Command Get-Service

Get-Service

# Get a specific service by name
Get-Service -Name "WinRM"
# Stop a specific service by name
Stop-Service -Name "WinRM"

# Change the startup type of a service

Set-Service -Name "WinRM" -StartupType Automatic

```


In reality, there's a small subset of PowerShell commands you'll need to learn thoroughly. 




## Exercise 1: Finding Firewall-related Cmdlets

Imagine we need to find something related to Firewalls. Let's use `Get-Command` to help us:

1. We know it should start with `Get-`
2. The second part might contain "Firewall" or "FW"
3. It's likely a built-in Windows command

Try to construct a `Get-Command` query to find this cmdlet.

## Exercise 2: Discovering the Show-Command Cmdlet

There's a command that allows us to see a graphical interface for all the parameters needed for a cmdlet.

We know:
- It's related to commands
- It displays a graphic interface

Try to find this cmdlet using `Get-Command`.

## Additional Notes

- `Get-Command *` shows all commands, including non-native ones.
- PowerShell's consistent syntax makes it easier to find commands for unfamiliar products that support PowerShell cmdlets.

## Challenge

Try to find a command which outputs firewall information. Use the techniques we've discussed to narrow down your search.

Happy cmdlet hunting!
````

This README.md file provides a structured introduction to `Get-Command` and includes two exercises for your students to practice. It maintains the conversational tone of your original text while organizing the content into clear sections. The exercises are presented as challenges to encourage active learning and exploration.
`````
