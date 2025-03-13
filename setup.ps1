New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\Documents\PowerShell\ -Name Profile.ps1 -Value D:\Dev\dotfiles\Profile.ps1

New-Item -ItemType Junction -Path C:\Users\jurica.bacurin\AppData\Local -Name 'nvim' -Target 'D:\Dev\dotfiles\nvim\'

New-Item -ItemType SymbolicLink -Path C:\Users\jurica.bacurin\ -Name .wezterm.lua -Value D:\Dev\dotfiles\wezterm\wezterm.lua

New-Item -ItemType SymbolicLink -Path C:\Users\juric\AppData\Roaming\nushell\ -Name config.nu -Value C:\Users\juric\Dev\dotfiles\nushell\config.nu
New-Item -ItemType SymbolicLink -Path C:\Users\juric\AppData\Roaming\nushell\ -Name env.nu -Value C:\Users\juric\Dev\dotfiles\nushell\env.nu
New-Item -ItemType Junction -Path C:\Users\juric\AppData\Roaming\nushell\ -Name 'custom-completions' -Target C:\Users\juric\Dev\dotfiles\nu_scripts\custom-completions\

New-Item -ItemType SymbolicLink -Path C:\Users\juric\.config\ -Name starship.toml -Value C:\Users\juric\Dev\dotfiles\starship\starship.toml
