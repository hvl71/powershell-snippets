#tested on Ubuntu with Powershell core 7.2
$OS=[System.Environment]::OSVersion.Platform
if(!($OS -eq "Win32NT")){
    Write-Output "This script is only supported on Windows.. aborting.."
    exit
}

if(!(Test-Path -Path $PROFILE)){
    Write-Output "Creating $PROFILE.."
    New-Item -ItemType File -Path $PROFILE
}

if(!(Test-Path -Path alias:nano)){
    #Adding the Nano editor to the Powershell user profile permanently
    $NanoPath="C:\Program Files\Git\usr\bin\nano.exe"
    if(Test-Path -Path $NanoPath){
        Write-Output "Found the Nano editor here $NanoPath"
        Write-Output "Adding Nano to the user specific powershell profile here $PROFILE"
        Add-Content -Path $PROFILE -Value "set-alias nano `"$NanoPath`""
        . $PROFILE
        Write-Output "Nano added to profile and ready to use in current and future sessions.. just type nano to use.."
    }else{
        Write-Output "The Nano editor could not be found in $NanoPath. Usually it's installed with git.."
    }
}

if(!(test-path alias:note)){
    #Adding notepad to the Powershell user profile permanently
    #where.exe notepad could be used to find location
    $NotepadPath="C:\Windows\System32\notepad.exe"
    if(Test-Path -Path $NotepadPath){
        Write-Output "Found the notepad editor here $NotepadPath"
        Write-Output "Adding notepad to the user specific powershell profile here $PROFILE"
        Add-Content -Path $PROFILE -Value "set-alias note `"$NotepadPath`""
        . $PROFILE
        Write-Output "Notepad added to profile and ready to use in current and future sessions.. just type note to use.."
    }else{
        Write-Output "The notepad editor could not be found in $NotepadPath"
        Write-Output "Maybe it can be found elsewhere using where.exe notepad.."
        where.exe notepad
    }
}

 
