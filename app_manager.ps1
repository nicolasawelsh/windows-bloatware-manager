function Manage-App {
	param( [Parameter (Mandatory = $true)] [String]$ProgramName )

    Write-Host "Would you like to uninstall (u), reinstall (r), or ignore (i) the following app?"
	$choice = Read-Host "$($ProgramHash.$ProgramName)"

    if ($choice -eq 'u') {
        Get-AppxPackage -AllUsers *$ProgramName* | Remove-AppxPackage -ErrorAction SilentlyContinue
        Write-Host "$($ProgramHash.$ProgramName) uninstalled."
        Write-Host
    } elseif ($choice -eq 'r') {
        Add-AppxPackage -register "C:\Program Files\WindowsApps\$ProgramName*\appxmanifest.xml" -DisableDevelopmentMode
        #Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "C:\Program Files\WindowsApps\$ProgramName*\appxmanifest.xml"}
        Write-Host "$($ProgramHash.$ProgramName) installed."
        Write-Host
    } elseif ($choice -eq 'i') {
        Write-Host "Ignoring $($ProgramHash.$ProgramName)."
        Write-Host
    } else {
        Write-Host "Invalid selection."
        Write-Host
        Manage-App -ProgramName $ProgramName
    }
}

$ProgramHash = @{"Microsoft.Microsoft3DViewer"="3D Viewer";
                 "Microsoft.WindowsAlarms"="Alarms and Clock";
                 "Microsoft.WindowsCommunicationsApps"="Calendar and Mail";
                 "Microsoft.WindowsCamera"="Camera";
                 "Microsoft.MicrosoftOfficeHub"="Get Office";
                 "Microsoft.SkypeApp"="Skype";
                 "Microsoft.Getstarted"="Tips";
                 "Microsoft.GetHelp"="Get Help";
                 "Microsoft.ZuneMusic"="Groove Music";
                 "Microsoft.WindowsMaps"="Maps";
                 "Microsoft.MicrosoftSolitaireCollection"="Solitaire Collection";
                 "Microsoft.Office.OneNote"="OneNote";
                 "Microsoft.People"="People";
                 "Microsoft.WindowsSoundRecorder"="Voice Recorder";
                 "Microsoft.BingWeather"="Weather";
                 "Microsoft.Wallet"="Wallet";
                 "Microsoft.WindowsFeedbackHub"="Feedback Hub";
                 "Microsoft.YourPhone"="Your Phone";
                 "Microsoft.MSPaint"="Paint 3D";
                 "Microsoft.MicrosoftStickyNotes"="Sticky Notes";
                 "Microsoft.ZuneVideo"="Movies & TV";
                 "Microsoft.Windows.Photos"="Photos";
                 "Microsoft.WindowsCalculator"="Calculator";
                 "Microsoft.MixedReality.Portal"="Mixed Reality Portal";
                 "xbox"="Xbox Apps";
                }

foreach ($ProgramKey in $ProgramHash.Keys) {
    Manage-App -ProgramName $ProgramKey
}

Write-Host "Restart your system after making any changes."

<#
To reinstall all default windows apps run the following:
    Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
#>



