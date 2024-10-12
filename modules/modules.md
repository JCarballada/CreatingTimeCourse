# Modules in Programming and PowerShell

## What are Modules?

Modules are self-contained units of code that encapsulate related functionality, data, and resources. 
In PowerShell, modules are extensions that add new commands and functionality to the shell.
They are designed to be reusable, maintainable, and organized components of a larger software system. 


You can extend PowerShell's capabilities by installing modules. 
These modules can add new commands (cmdlets) and functions to PowerShell.

### Working with Modules


1. **PowerShell Modules**

#### Default & Available Modules
- View modules currently loaded in your session:
  ```powershell
  Get-Module
  ```
- See all modules present on the system:
  ```powershell
  Get-Module -ListAvailable
  ```

#### Importing Modules
Explicitly load a module into your session:
```powershell
Import-Module ModuleName
```

2. **Modules Structure**: 

PowerShell modules typically consist of a single folder containing the module files. This folder is usually named after the module itself. 
You simply place the module folder in one of the PowerShell module paths .
You can download it from a repository like the PowerShell Gallery.

PowerShell looks for modules in specific paths. You can view these paths with:

   ```powershell
   $env:PSModulePath 
   ```

Registered PowerShell repositories:
   ```powershell
   Get-PSRepository
   ```

PowerShell checks these locations in order when searching for modules to import or install. The `Get-PSRepository` cmdlet allows you to see all registered repositories, which typically includes the PSGallery by default and any additional repositories that have been added to your PowerShell environment.

3. **Autoloading**:  This means you don't always need to explicitly import a module before using its commands.

### Key Module Commands

#### Get-Module

The `Get-Module` cmdlet is used to list the modules that are currently loaded in your PowerShell session or available to be loaded:

- List loaded modules:
  ```powershell
  Get-Module
  ```

- List available modules:
  ```powershell
  Get-Module -ListAvailable
  ```

#### Import-Module

While autoloading often takes care of importing modules as needed, you can manually import a module using `Import-Module`:


### Finding and Installing PowerShell Modules

1. Browse the PowerShell Gallery using the command:
   ```powershell
   Find-Module -Name *keyword*
   ```

2. Install a module using:
   ```powershell
   Install-Module -Name ModuleName
   ```

3. Import the installed module:
   ```powershell
   Import-Module ModuleName
   ```

### Finding a Module: ImportExcel

99% of the scripts is to retrieve some sources of data, process it and present it in a useful way.
As a built in cmdlet, we have Export-CSV which is a good option to create a comma separated file which can be opened and processed.
Excel is a very common format to present data.

Let's explore a module: ImportExcel. 
This module allows you to create Excel spreadsheets directly from PowerShell, without needing Excel installed.

1. Find a module on the gallery:
   ```powershell
   Find-Module -tag "excel"
   ```

2. Find a module on the gallery and save it in the current folder:
   Lets explore the ImportExcel module:
   ```powershell
   Save-Module -name ImportExcel -Path .
   ```


3. Explore the module and Import it:
   ```powershell
   Import-module -Module C:\MyCurrentFolder\Whereitis\ImportExcel
   ```
      We have saved the module in the current folder, so we can import it.
      There is the $env:PSModulePath variable that it is the path where PowerShell will look for modules.
      If module is on this path, we can import it using the Import-Module cmdlet.
      Autoloading will load the module when needed, but we can use Import-Module to load it explicitly.

4. Install the ImportExcel module:
   ```powershell
   Install-Module -Name ImportExcel -Scope CurrentUser -Force
   ```
   It will be installed in the $env:USERPROFILE\Documents\PowerShell\Modules folder.
   if we change the scope to AllUsers, it will be installed in the $env:ProgramFiles\PowerShell\Modules folder.
   Accessilbe to any user on the system


5. Using the ImportExcel module to create an Excel file:
       
   ```powershell
   Get-ChildItem . -file | select name,length -First 10  |  Export-Excel -Path .\FileTest.xlsx -WorksheetName "Files" -ChartType Pie -ExcelChartDefinition @{
     YRange = 'Files!B2:B21'  
     Title = '10 Files Size Chart'
   } -Show 
  ```

This one-liner does the following:
1. Creates an Excel file named 'FileList.xlsx' on your current folder
2. We select a list of the first 10 files we found on the current directory 
3. We export the data to Excel on a Sheet named Files and we add a chart of type Pie to show the size of each file.

This example shows how you can quickly create multi-sheet Excel files using the ImportExcel module with minimal PowerShell code.

### Conclusion

Modules greatly extend PowerShell's capabilities, allowing you to tailor your environment to your specific needs. Whether using built-in modules, installing from the Gallery, or creating your own, understanding modules is key to mastering PowerShell.


> While the PowerShell Gallery is a valuable resource, it's important to note that Microsoft doesn't verify all code uploaded to it. Always research a module's reputation and review its code before installing, especially in production environments.
