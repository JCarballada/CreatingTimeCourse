# PowerShell Pipelining and Aliases

## Pipelining

Pipelining is a powerful feature in PowerShell that allows you to chain multiple cmdlets together. The output of one cmdlet becomes the input for the next cmdlet in the pipeline, enabling complex operations to be performed efficiently.

### Basic Example:

```powershell
Get-Process | Sort-Object -Property CPU -Descending | ConvertTo-Html | Out-File ProcessesByCPU.html
```

This pipeline does the following:
1. `Get-Process`: Retrieves all running processes
2. `Sort-Object -Property CPU -Descending`: Sorts the processes by CPU usage in descending order
3. `ConvertTo-Html`: Converts the sorted list into HTML format
4. `Out-File ProcessesByCPU.html`: Saves the HTML output to a file

After running this command, you'll have an HTML file named ProcessesByCPU.html in your current directory. Open it in a web browser to see a nicely formatted table of processes sorted by CPU usage.

### Commonly Used Cmdlets in Pipelines

Here are some of the most frequently used cmdlets in pipelines:

1. **Select-Object**: Selects specified properties of an object.
   Example:
   ```powershell
   Get-Process | Select-Object Name, CPU, WorkingSet
   ```

2. **Where-Object**: Filters objects based on specified criteria.
   Example:
   ```powershell
   Get-Process | Where-Object { $_.CPU -gt 10 }
   ```

Other important cmdlets for pipeline operations include:
- ForEach-Object
- Sort-Object
- Group-Object
- Measure-Object

We'll dig more into these later, but these cmdlets form the backbone of many PowerShell operations and are crucial for effective data manipulation and analysis.

### Practical Exercise:

Let's create a pipeline to identify large files in your Downloads folder:

```powershell
Get-ChildItem $env:USERPROFILE\Downloads |
    Where-Object { $_.Length -gt 100MB } |
    Select-object Name, Length , Fullname -first 10|
    ConvertTo-Html |
    Out-File LargeDownloads.html
```


This pipeline:
1. Gets all items in your Downloads folder
2. Filters for files larger than 100MB
3. Selects the Name, Length and Fullname and limits the output to 10
4. Converts to HTML and saves the result for Reporting

> Note: `$env:USERPROFILE` is an environment variable in PowerShell. Environment variables are prefixed with `$env:` in PowerShell. `USERPROFILE` specifically points to the current user's profile folder (typically C:\Users\YourUsername). So, `$env:USERPROFILE\Downloads` refers to your Downloads folder.

After running this, open LargeDownloads.html in your browser to see which large files are taking up space in your Downloads folder.

## Aliases

Aliases in PowerShell are shortcuts or alternate names for cmdlets. 
They allow for quicker typing and can make command-line operations more efficient.

Some common aliases include are well known to keep dos/linux experience:
- `ls` or `dir` for `Get-ChildItem`
- `cd` for `Set-Location`
- `cls` for `Clear-Host`

You can view all aliases using the `Get-Alias` cmdlet.

### Quick Exercise:

Try to find out what `?` and `%` mean in PowerShell. These are aliases for commonly used cmdlets in pipelines.

Hint: Use `Get-Alias ?` and `Get-Alias %` to discover their meanings.

While aliases are great for interactive use, it's generally recommended to use full cmdlet names in scripts for better readability and maintainability.


In future lessons, we'll explore essential PowerShell discovery commands like Get-Help, Get-Command, and Get-Member. These will help you understand cmdlet parameters, find relevant commands, and explore object properties, enhancing your ability to construct effective PowerShell commands and pipelines.
````

This addition provides a bit more context about why these commands are important, specifically mentioning their role in understanding parameters, finding commands, and exploring object properties. It ties back to the current lesson on pipelining by highlighting how these skills will help in constructing effective PowerShell commands and pipelines.
````
