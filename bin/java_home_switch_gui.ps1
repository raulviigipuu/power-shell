Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Define the paths for different Java versions
$javaVersions = @(
    @{ "Name" = "JDK 8"; "Path" = "C:\data\dev_env\jdk8u392-b08" },
    @{ "Name" = "JDK 17"; "Path" = "C:\data\dev_env\jdk-17.0.8+7" },
    @{ "Name" = "JDK 21"; "Path" = "C:\data\dev_env\jdk-21" }
)

# Determine the current JAVA_HOME value
$currentJavaHome = [Environment]::GetEnvironmentVariable("JAVA_HOME", [System.EnvironmentVariableTarget]::User)

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select JAVA_HOME'
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = 'CenterScreen'

# Function to apply JAVA_HOME change
function ApplyJavaHomeChange {
    $selectedVersion = $listBox.SelectedItem
    foreach ($version in $javaVersions) {
        if ($version.Name -eq $selectedVersion) {
            [Environment]::SetEnvironmentVariable("JAVA_HOME", $version.Path, [System.EnvironmentVariableTarget]::User)
            [System.Windows.Forms.MessageBox]::Show("JAVA_HOME set to $($version.Path)`nPlease restart your applications to apply the changes.", "JAVA_HOME Updated", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            $form.Close()
            break
        }
    }
}

# Create the ListBox for Java version selection
$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10, 10)
$listBox.Size = New-Object System.Drawing.Size(260, 100)

# Add Java versions to the ListBox and select the current one
foreach ($version in $javaVersions) {
    $index = $listBox.Items.Add($version.Name)
    if ($version.Path -eq $currentJavaHome) {
        $listBox.SelectedIndex = $index
    }
}

# Add DoubleClick event handler to apply change on double-click
$listBox.Add_DoubleClick({
    ApplyJavaHomeChange
})

$form.Controls.Add($listBox)

# Create the Apply button
$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Location = New-Object System.Drawing.Point(10, 120)
$applyButton.Size = New-Object System.Drawing.Size(75, 23)
$applyButton.Text = 'Apply'
$applyButton.Add_Click({
    ApplyJavaHomeChange
})

$form.Controls.Add($applyButton)

# Show the form
$form.ShowDialog()
