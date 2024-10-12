# PowerShell Cmdlets: Select-Object and Where-Object

PowerShell is a powerful scripting language and command-line shell that allows you to interact with your system and manage various aspects of it. Two essential cmdlets in PowerShell are `Select-Object` and `Where-Object`. These cmdlets help you filter and manipulate data effectively.

## Listening to Your Environment

Before we can effectively use PowerShell, we need to understand how to query our environment. This involves:

1. Filtering output
2. Retrieving data in the desired format
3. Understanding key commands

## Select-Object

`Select-Object` is one of the most frequently used cmdlets in PowerShell. It allows you to choose specific properties (or columns) of objects that you want to see in the output.

### Key features of Select-Object:

- Can select an arbitrary subset of output rows using `-First` and `-Last`
- Ability to limit the properties returned from a command using wildcards
- Can create custom or calculated properties

### Examples:
````powershell
Limit the properties returned
Get-Process | Select-Object -Property Name, Id
List everything but a few properties
Get-Process | Select-Object -Property -Exclude "Memory"
Get the first few objects
Get-ChildItem C:\ | Select-Object -First 5
Get the last few objects
Get-ChildItem C:\ | Select-Object -Last 3
````

## Where-Object

`Where-Object` is used to filter objects out of the pipeline based on specified criteria.

### Key features of Where-Object:

- Removes or filters objects based on conditions you specify
- Works well in combination with `Select-Object` for powerful data manipulation

### Example:
````powershell
Get processes with working set (WS) more than 100MB
Get-Process | Where-Object {$.WS -gt 100MB}
````

## ForEach-Object

`ForEach-Object` allows you to perform operations on each item in a collection of input objects.

### Key features of ForEach-Object:

- Executes a script block on each item in the pipeline
- Can be used for complex operations or simple property access
- Often abbreviated as `%` in PowerShell scripts

### Examples:
Using the % alias
````powershell
1..5 | % { $PSItem * 2 }
````

