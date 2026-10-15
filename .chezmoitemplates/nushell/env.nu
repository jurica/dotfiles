$env.config.show_banner = false

$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"

if (which starship | is-not-empty) {
    mkdir ($nu.data-dir | path join "vendor/autoload")
    starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}

{{ if eq .chezmoi.hostname "archtop" }}
$env.PATH = ($env.PATH | split row (char esep) | prepend '/home/jb/.local/bin')
{{ else if eq .chezmoi.hostname "win11" }}
$env.config.shell_integration.osc133 = false
$env.DIRENV_CONFIG = $"($env.LOCALAPPDATA)\\direnv"
$env.XDG_CACHE_HOME = $"($env.LOCALAPPDATA)\\cache"
$env.XDG_DATA_HOME = $"($env.LOCALAPPDATA)"
{{ else if eq .chezmoi.hostname "win11" }}
{{ end }}
