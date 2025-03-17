New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\Documents\PowerShell\ -Name Profile.ps1 -Value D:\Dev\dotfiles\Profile.ps1

New-Item -ItemType Junction -Path C:\Users\jurica.bacurin\AppData\Local -Name 'nvim' -Target 'D:\Dev\dotfiles\nvim\'

New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\ -Name .wezterm.lua -Value D:\Dev\dotfiles\wezterm\wezterm.lua

New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\AppData\Roaming\nushell\ -Name config.nu -Value D:\Dev\dotfiles\nushell\config.nu
New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\AppData\Roaming\nushell\ -Name env.nu -Value D:\Dev\dotfiles\nushell\env.nu
New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\AppData\Roaming\nushell\ -Name dragon-light.nu -Value D:\Dev\dotfiles\nushell\dragon-light.nu
New-Item -ItemType Junction -Path C:\Users\jurica.bacurin\AppData\Roaming\nushell\ -Name 'custom-completions' -Target D:\Dev\dotfiles\nu_scripts\custom-completions\

New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\.config\ -Name starship.toml -Value D:\Dev\dotfiles\starship\starship.toml
