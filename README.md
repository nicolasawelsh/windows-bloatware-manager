# Windows Bloatware Manager


## Introduction

Windows 10 and 11 come with pre-installed apps that can sometimes be unwanted by users. These apps not only take up space on the system but also impact the system's performance. This PowerShell script is designed to help the user remove or reinstall the pre-installed apps that could be considered bloatware on Windows 10 and 11.

Below is a screenshot of the default view of the Windows start menu on a fresh install of Windows 10 22H2, showing some of the bloatware installed by default:

![Bloatware-Ridden Start Menu](images/bloatware.PNG)

## Usage

1. Open PowerShell as Administrator.
2. Allow script execution by running the following command:\
`Set-ExecutionPolicy Unrestricted`
3. Download the PowerShell script from this repository by running the following command:\
`Invoke-WebRequest https://github.com/nicolasawelsh/windows-bloatware-manager/blob/main/app_manager.ps1 -OutFile app_manager.ps1`
4. Execute the script and follow the prompts to uninstall or reinstall Windows apps by running the following command:\
`.\app_manager.ps1`
5. Once done, disallow script execution by running the following command:\
`Set-ExecutionPolicy Restricted`


## Caution

PowerShell is a powerful Windows scripting language that could potentially cause irreversible damage to the system if not used properly. Before running this script, it is important to understand the code being executed. Also, note that the apps affected by the choices made during script execution will be applied to all users of the host machine.


## Reinstalling Default Windows Apps

If at any point you wish to reinstall all default Windows apps, execute the following command in PowerShell:\
`Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}`

