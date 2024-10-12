# PowerShell Cmdlets: Select-Object, Where-Object, and ForEach-Object

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


## Exercises

To practice these concepts, try the following exercises:

1. Get all Windows processes whose name starts with letter "s"
2. List processes whose name is svchost and PM (Private Memory) is more than 100MB
3. Get Process Name, Process ID and HandleCount where PM is more than 100MB and CPU more than 1000s
4. Export the results of (3) to html and CSV format
5. Use `ForEach-Object` to display the name and size of each file in the current directory, but only if the file is larger than 1MB

Remember, mastering these cmdlets will greatly enhance your ability to manipulate, analyze, and process data in PowerShell!

## Advanced Filtering with Logical Operators

When working with `Get-Process`, `Where-Object`, and `Select-Object`, you can use logical operators like `-and` and `-or` to create more complex filtering conditions. This allows for more precise and powerful data manipulation.

### Examples using AND and OR operators:

```powershell
# Get processes that use more than 100MB of memory AND have been running for more than 1 hour
Get-Process | Where-Object { $_.WorkingSet -gt 100MB -and $_.TotalProcessorTime.TotalHours -gt 1 } |
    Select-Object Name, Id, WorkingSet, TotalProcessorTime

# Get processes that are either system processes OR are using more than 500MB of memory
Get-Process | Where-Object { $_.Company -eq "Microsoft Corporation" -or $_.WorkingSet -gt 500MB } |
    Select-Object Name, Id, Company, WorkingSet

# Combine multiple conditions with parentheses for more complex logic
Get-Process | Where-Object { 
    ($_.Name -like "s*" -and $_.WorkingSet -gt 50MB) -or 
    ($_.Name -like "c*" -and $_.WorkingSet -gt 100MB) 
} | Select-Object Name, Id, WorkingSet
```

These examples demonstrate how to use `-and` and `-or` operators to create more sophisticated filters. You can combine multiple conditions to pinpoint exactly the processes you're interested in analyzing. By mastering these logical operators, you can create highly specific queries that allow you to extract precisely the information you need from your system.
