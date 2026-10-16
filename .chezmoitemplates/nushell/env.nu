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
{{ else if eq .chezmoi.hostname "SAB-C-000D0" }}
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/opt/ruby@3/bin')
$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
$env.Path = ($env.Path | append '/Users/baj1sab/Qt/Tools/CMake/CMake.app/Contents/bin')
$env.Path = ($env.Path | append '/Users/baj1sab/Qt/Tools/Ninja')
$env.Path = ($env.Path | append '/Users/baj1sab/.local/bin')

$env.JAVA_HOME = "/Users/baj1sab/jdk-26.jdk/Contents/Home"
{{ else if eq .chezmoi.hostname "SAB-C-000CW" }}
$env.Path = ($env.Path | append $"($env.HOMEDRIVE)($env.HOMEPATH)\\.local\\bin")
{{ else if eq .chezmoi.hostname "SAB-C-000D0" "SAB-C-000CW" }}
def --env setProxy [] {
  $env.http_proxy = "http://proxyemea.keen.tech:8080"
  $env.https_proxy = "http://proxyemea.keen.tech:8080"
  $env.all_proxy = "http://proxyemea.keen.tech:8080"
}
def --env unsetProxy [] {
  hide-env all_proxy; hide-env https_proxy; hide-env http_proxy
}
{{ end }}
