
function MyFunction([string]$Message){
    Write-Host $Message
}

$Debugging=$MyInvocation.InvocationName -eq $MyInvocation.MyCommand.Definition
if($Debugging){
    Write-Host "This block will only be executed when running in a debugger like VS Code or ISE.. useful when demoing.." -foregroundcolor Yellow
    #Handy when leaving sample calls in scripts without having to comment/uncomment constantly (annoying when using VCS)
    MyFunction -Message "Calling MyFunction.."    
}else{
    Write-Host "Not executing debug specific function call.. only included for demonstrational purposes.."
}
