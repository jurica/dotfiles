New-Item -ItemType SymbolicLink -Path C:\Users\juric\Documents\PowerShell\ -Name Profile.ps1 -Value C:\Repos\dotfiles\Profile.ps1
New-Item -ItemType Junction -Path C:\Users\juric\AppData\Local -Name 'nvim' -Target 'C:\Repos\dotfiles\nvim\'
New-Item -ItemType SymbolicLink -Path C:\Users\juric\ -Name .wezterm.lua -Value C:\Repos\dotfiles\wezterm\wezterm.lua
