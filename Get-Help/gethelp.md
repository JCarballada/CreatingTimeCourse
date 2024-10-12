# Understanding Get-Help in PowerShell


Using the Get-Command we can find out the name of the cmdlet we want to get help on.
With the Get-Help we can dig into more details for the cmdlet we are interested in.


# Introduction

`Get-Help` is a powerful cmdlet in PowerShell that provides comprehensive help and documentation for cmdlets, functions, scripts, and concepts. It's an essential tool for both beginners and experienced PowerShell users.


### Basic Usage

To get help on any cmdlet, simply type `Get-Help` followed by the cmdlet name:

powershell
Get-Help Get-Process

### Detailed Help

This will display basic information about the `Get-Process` cmdlet.

For more detailed information, use the `-Detailed

### Full Help

To see all available help content, including examples, use the `-Full` parameter:


### Online Help

To view the most up-to-date help content in your web browser, use the `-Online` parameter:
```` powershell
Get-Help Get-Process -Online
````

### Examples

To see examples of how to use a cmdlet, use the `-Examples` parameter:

```` powershell
Get-Help Get-Process -Examples
````

## Update Help

```` powershell
Update-Help
````

The `Update-Help` cmdlet downloads the latest help content, including new cmdlets and updated information. It retrieves `.help.xml` files for all installed modules, ensuring you have the most current documentation.



## How Help Works in PowerShell

PowerShell's help system is dynamic and updateable. Here's how it works:

1. **Help Files**: PowerShell help content is stored in special XML files with a `.help.xml` extension. These files contain all the information you see when you use `Get-Help`.

2. **Local Storage**: When you install PowerShell, it comes with a basic set of help files. These are stored locally on your computer, typically in the `$PSHOME\en-US` directory (for English language help).

3. **Updatable Content**: PowerShell allows you to update these help files to get the latest information. This is done using the `Update-Help` cmdlet.

4. **Online vs. Offline**: PowerShell can display help content from your local files (offline) or from Microsoft's web servers (online). The `-Online` parameter of `Get-Help` opens the most up-to-date help in your web browser.



5.  **Conceptual Help**: In addition to cmdlet help, PowerShell includes "about" topics that explain broader concepts. These are also stored in `.help.xml` files.


Get-Help about_*






