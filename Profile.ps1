$env:PATH = "C:\Users\juric\AppData\Local\w64devkit\bin;" + $env:PATH

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

function switch_theme {
    param (
        [string]$Argument
    )

    sed -E -i "s/config\.color_scheme = '([^']+)'/config.color_scheme = '$Argument'/" C:\Repos\dotfiles\wezterm\wezterm.lua
    Write-Output "switched to: $Argument, please reload wezterm config using Shift-Ctrl-r"
}
