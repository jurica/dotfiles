Function Get-TimeStamp {
    return "[{0:dd.MM.yy} {0:HH:mm:ss.fff}" -f (Get-Date)
}

$env:PATH = "$HOME\AppData\Local\Programs\WezTerm;$HOME\AppData\Local\Programs\w64devkit\bin;" + $env:PATH
$env:VISUAL = "nvim"
$env:EDITOR = "nvim"

Set-PSReadLineOption -EditMode Emacs

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
$env:FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

Function cmake_configure_preset {
    cmake --preset=$(cmake --list-presets | tail -n +3 | fzf | cut -d '"' -f2)
}
Function cmake_build_preset {
    cmake --build --preset=$(cmake --list-presets=build | tail -n +3 | fzf | cut -d '"' -f2)
}

Set-Alias -Name vswhere -Value 'C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe'
$env:VS_INSTANCEID=$(vswhere -format value -property instanceId)
Function vsdevshell32 {
    Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell $env:VS_INSTANCEID -SkipAutomaticLocation -DevCmdArguments "-arch=x86 -host_arch=x64"
}
Function vsdevshell64 {
    Import-Module "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
    Enter-VsDevShell $env:VS_INSTANCEID -SkipAutomaticLocation -DevCmdArguments "-arch=x64 -host_arch=x64"
}

function switch_theme {
    param (
        [string]$Argument
    )

    sed -E -i "s/config\.color_scheme = '([^']+)'/config.color_scheme = '$Argument'/" C:\Repos\dotfiles\wezterm\wezterm.lua
    Write-Output "switched to: $Argument, please reload wezterm config using Shift-Ctrl-r"
}
