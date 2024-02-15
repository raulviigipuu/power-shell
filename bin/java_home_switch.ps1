# Ask the user to choose a Java version
Write-Host "Choose the Java version:"
Write-Host "[1] JDK 8"
Write-Host "[2] JDK 17"
Write-Host "[3] JDK 21"
Write-Host ""

# Read the user's choice
$choice = Read-Host "Type the number of the desired version and press ENTER"

# Set JAVA_HOME based on the choice
switch ($choice) {
    "1" {
        $JAVA_HOME = "C:\data\dev_env\jdk8u392-b08"
    }
    "2" {
        $JAVA_HOME = "C:\data\dev_env\jdk-17.0.8+7"
    }
    "3" {
        $JAVA_HOME = "C:\data\dev_env\jdk-21"
    }
    default {
        Write-Host "Invalid choice."
        exit
    }
}

# Set the JAVA_HOME environment variable for the user
[Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_HOME, [System.EnvironmentVariableTarget]::User)

Write-Host "JAVA_HOME set to $JAVA_HOME"
Write-Host "Please restart your PowerShell session to apply the changes."
