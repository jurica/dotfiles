# Get the directory where this script is located
$DotfilesPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$HomeDir = $env:USERPROFILE

# Remove existing Profile.ps1 if it exists
if (Test-Path "$HomeDir\Documents\PowerShell\Profile.ps1") {
    Remove-Item "$HomeDir\Documents\PowerShell\Profile.ps1" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\Documents\PowerShell\" -Name Profile.ps1 -Value "$DotfilesPath\Profile.ps1"

# Remove existing nvim junction if it exists
if (Test-Path "$HomeDir\AppData\Local\nvim") {
    Remove-Item "$HomeDir\AppData\Local\nvim" -Force -Recurse
}
New-Item -ItemType Junction -Path "$HomeDir\AppData\Local" -Name 'nvim' -Target "$DotfilesPath\nvim\"

# Remove existing wezterm junction if it exists
if (Test-Path "$HomeDir\.config\wezterm") {
    Remove-Item "$HomeDir\.config\wezterm" -Force -Recurse
}
New-Item -ItemType Junction -Path "$HomeDir\.config" -Name wezterm -Target "$DotfilesPath\wezterm\"

if (Test-Path "$HomeDir\AppData\Local\direnv\direnv.toml") {
    Remove-Item "$HomeDir\AppData\Local\direnv\direnv.toml" -Force -Recurse
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\AppData\Local\direnv\" -Name direnv.toml -Value "$DotfilesPath\direnv\direnv_windows.toml"

# Remove existing nushell config files if they exist
if (Test-Path "$HomeDir\AppData\Roaming\nushell\config.nu") {
    Remove-Item "$HomeDir\AppData\Roaming\nushell\config.nu" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\AppData\Roaming\nushell\" -Name config.nu -Value "$DotfilesPath\nushell\config.nu"

if (Test-Path "$HomeDir\AppData\Roaming\nushell\env.nu") {
    Remove-Item "$HomeDir\AppData\Roaming\nushell\env.nu" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\AppData\Roaming\nushell\" -Name env.nu -Value "$DotfilesPath\nushell\env_windows.nu"

if (Test-Path "$HomeDir\AppData\Roaming\nushell\dragon-light.nu") {
    Remove-Item "$HomeDir\AppData\Roaming\nushell\dragon-light.nu" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\AppData\Roaming\nushell\" -Name dragon-light.nu -Value "$DotfilesPath\nushell\dragon-light.nu"

if (Test-Path "$HomeDir\AppData\Roaming\nushell\custom-completions") {
    Remove-Item "$HomeDir\AppData\Roaming\nushell\custom-completions" -Force -Recurse
}
New-Item -ItemType Junction -Path "$HomeDir\AppData\Roaming\nushell\" -Name 'custom-completions' -Target "$DotfilesPath\nu_scripts\custom-completions\"

# Remove existing starship.toml if it exists
if (Test-Path "$HomeDir\.config\starship.toml") {
    Remove-Item "$HomeDir\.config\starship.toml" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\.config\" -Name starship.toml -Value "$DotfilesPath\starship\starship.toml"

# Remove existing lazygit config if it exists
if (Test-Path "$HomeDir\AppData\Local\lazygit\config.yml") {
    Remove-Item "$HomeDir\AppData\Local\lazygit\config.yml" -Force
}
New-Item -ItemType SymbolicLink -Path "$HomeDir\AppData\Local\lazygit\" -Name config.yml -Target "$DotfilesPath\lazygit\config.yml"
