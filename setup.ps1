New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\Documents\PowerShell\ -Name Profile.ps1 -Value D:\Dev\dotfiles\Profile.ps1
New-Item -ItemType Junction -Path C:\Users\jurica.bacurin\AppData\Local -Name 'nvim' -Target 'D:\Dev\dotfiles\nvim\'
New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\ -Name .wezterm.lua -Value D:\Dev\dotfiles\wezterm\wezterm.lua
