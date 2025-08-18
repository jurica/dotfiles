New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\Documents\PowerShell\ -Name Profile.ps1 -Value C:\Users\baj1sab\Dev\dotfiles\Profile.ps1

New-Item -ItemType Junction -Path C:\Users\baj1sab\AppData\Local -Name 'nvim' -Target 'C:\Users\baj1sab\Dev\dotfiles\nvim\'

New-Item -ItemType Junction -Path C:\Users\baj1sab\.config -Name wezterm -Target 'C:\Users\baj1sab\Dev\dotfiles\wezterm\'

New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\AppData\Roaming\nushell\ -Name config.nu -Value C:\Users\baj1sab\Dev\dotfiles\nushell\config.nu
New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\AppData\Roaming\nushell\ -Name env.nu -Value C:\Users\baj1sab\Dev\dotfiles\nushell\env.nu
New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\AppData\Roaming\nushell\ -Name dragon-light.nu -Value C:\Users\baj1sab\Dev\dotfiles\nushell\dragon-light.nu
New-Item -ItemType Junction -Path C:\Users\baj1sab\AppData\Roaming\nushell\ -Name 'custom-completions' -Target C:\Users\baj1sab\Dev\dotfiles\nu_scripts\custom-completions\

New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\.config\ -Name starship.toml -Value C:\Users\baj1sab\Dev\dotfiles\starship\starship.toml

New-Item -ItemType SymbolicLink -Path C:\Users\baj1sab\AppData\Local\lazygit\ -Name config.yml -Target 'C:\Users\baj1sab\Dev\dotfiles\lazygit\config.yml'
