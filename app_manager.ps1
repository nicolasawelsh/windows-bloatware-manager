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

$ProgramHash = @{"Microsoft.BingWeather"="Weather";
                 "Microsoft.Getstarted"="Tips";
                 "Microsoft.GetHelp"="Get Help";
                 "Microsoft.Microsoft3DViewer"="3D Viewer";
                 "Microsoft.MicrosoftOfficeHub"="Get Office";
                 "Microsoft.MicrosoftSolitaireCollection"="Solitaire Collection";
                 "Microsoft.MicrosoftStickyNotes"="Sticky Notes";
                 "Microsoft.MixedReality.Portal"="Mixed Reality Portal";
                 "Microsoft.MSPaint"="Paint 3D";
                 "Microsoft.Office.OneNote"="OneNote";
                 "Microsoft.People"="People";
                 "Microsoft.SkypeApp"="Skype";
                 "Microsoft.Wallet"="Wallet";
                 "Microsoft.WindowsAlarms"="Alarms and Clock";
                 "Microsoft.WindowsCalculator"="Calculator";
                 "Microsoft.WindowsCamera"="Camera";
                 "Microsoft.WindowsCommunicationsApps"="Calendar and Mail";
                 "Microsoft.WindowsFeedbackHub"="Feedback Hub";
                 "Microsoft.WindowsMaps"="Maps";
                 "Microsoft.Windows.Photos"="Photos";
                 "Microsoft.WindowsSoundRecorder"="Voice Recorder";
                 "Microsoft.YourPhone"="Your Phone";
                 "Microsoft.ZuneMusic"="Groove Music";
                 "Microsoft.ZuneVideo"="Movies & TV";
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
