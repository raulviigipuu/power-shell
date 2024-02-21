# Load Windows Forms and drawing assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the NotifyIcon object
$notifyIcon = New-Object System.Windows.Forms.NotifyIcon

# Set the icon. Change the path to your own .ico file or use a built-in one
$notifyIcon.Icon = [System.Drawing.SystemIcons]::Application

# Set the hover text that appears when the mouse hovers over the icon
$notifyIcon.Text = "Your hover text here"

# Make the icon visible in the system tray
$notifyIcon.Visible = $true

# Create a context menu (right-click menu)
$contextMenu = New-Object System.Windows.Forms.ContextMenuStrip
$item = New-Object System.Windows.Forms.ToolStripMenuItem
$item.Text = "Exit"
$item.Add_Click({
        $notifyIcon.Visible = $false
        $notifyIcon.Dispose()
        [System.Environment]::Exit(0)
    })
$contextMenu.Items.Add($item)
$notifyIcon.ContextMenuStrip = $contextMenu

# Prevent the PowerShell window from closing immediately
[void] [System.Windows.Forms.Application]::Run()
