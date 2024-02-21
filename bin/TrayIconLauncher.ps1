# Path to your main script
$mainScriptPath = ".\TrayIconScript.ps1"

# Options for the PowerShell process
$processOptions = @{
    FilePath     = "powershell.exe"
    ArgumentList = "-NoProfile", "-ExecutionPolicy Bypass", "-WindowStyle Hidden", "-File `"$mainScriptPath`""
    WindowStyle  = "Hidden"
    PassThru     = $true
}

# Start the main script in a new background process with the specified options
$process = Start-Process @processOptions

Write-Host "Main script launched with PID: $($process.Id)"
