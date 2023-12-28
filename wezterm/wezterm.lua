local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'dragon-light'
config.font         = wezterm.font('RobotoMono Nerd Font')
config.font_size    = 14

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'pwsh.exe' }
    config.font_size    = 11
end

config.window_decorations             = 'RESIZE'

config.use_fancy_tab_bar              = false
config.enable_tab_bar                 = true

local themes                          = {}

themes['nord']                        = {}
themes['nord']['foreground']          = "#d8dee9"
themes['nord']['background']          = "#2e3440"
themes['nord']['cursor_bg']           = "#eceff4"
themes['nord']['cursor_border']       = "#eceff4"
themes['nord']['cursor_fg']           = "#282828"
themes['nord']['selection_bg']        = "#eceff4"
themes['nord']['selection_fg']        = "#4c566a"
themes['nord']['ansi']                = { "#3b4252", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#88c0d0", "#e5e9f0" }
themes['nord']['brights']             = { "#4c566a", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#8fbcbb", "#eceff4" }
themes['nord']['tab_bar_bg']          = '#2E3440'
themes['nord']['active_tab_bg']       = '#81A1C1'
themes['nord']['active_tab_fg']       = '#2E3440'
themes['nord']['tab_bg']              = '#3B4252'
themes['nord']['tab_fg']              = '#D8DEE9'

themes['nord-light']                  = {}
themes['nord-light']['foreground']    = "#414858"
themes['nord-light']['background']    = "#e5e9f0"
themes['nord-light']['cursor_bg']     = "#88c0d0"
themes['nord-light']['cursor_border'] = "#88c0d0"
themes['nord-light']['cursor_fg']     = "#3b4252"
themes['nord-light']['selection_bg']  = "#d8dee9"
themes['nord-light']['selection_fg']  = "#4c556a"
themes['nord-light']['ansi']          = { "#3b4252", "#bf616a", "#a3be8c", "#c87b2e", "#81a1c1", "#b48ead", "#88c0d0", "#a0a0a0" }
themes['nord-light']['brights']       = { "#4c566a", "#bf616a", "#a3be8c", "#c87b2e", "#81a1c1", "#b48ead", "#8fbcbb", "#a0a0a0" }
themes['nord-light']['tab_bar_bg']    = '#ECEFF4'
themes['nord-light']['active_tab_bg'] = '#81A1C1'
themes['nord-light']['active_tab_fg'] = '#ECEFF4'
themes['nord-light']['tab_bg']        = '#E5E9F0'
themes['nord-light']['tab_fg']        = '#434C5E'

themes['dragon-light']                  = {}
themes['dragon-light']['foreground']    = "#1b1b1b"
themes['dragon-light']['background']    = "#E7E7E7"
themes['dragon-light']['cursor_bg']     = "#c8c8c8"
themes['dragon-light']['cursor_border'] = "#c8c8c8"
themes['dragon-light']['cursor_fg']     = "#1b1b1b"
themes['dragon-light']['selection_bg']  = "#E7E7E7"
themes['dragon-light']['selection_fg']  = "#a0a0a0"
themes['dragon-light']['ansi']          = { "#1b1b1b", "#b73242", "#6a824f", "#c87b2e", "#658594", "#b1b1d2", "#658594", "#a0a0a0" }
themes['dragon-light']['brights']       = { "#1b1b1b", "#b73242", "#6a824f", "#c87b2e", "#658594", "#b1b1d2", "#658594", "#a0a0a0" }
themes['dragon-light']['tab_bar_bg']    = '#E7E7E7'
themes['dragon-light']['active_tab_bg'] = '#f6f6f6'
themes['dragon-light']['active_tab_fg'] = '#1b1b1b'
themes['dragon-light']['tab_bg']        = '#EEEEEE'
themes['dragon-light']['tab_fg']        = '#A2A2A2'

config.colors                         = {
    foreground = themes[config.color_scheme]['foreground'],
    background = themes[config.color_scheme]['background'],
    cursor_fg = themes[config.color_scheme]['cursor_fg'],
    cursor_bg = themes[config.color_scheme]['cursor_bg'],
    selection_fg = themes[config.color_scheme]['selection_fg'],
    selection_bg = themes[config.color_scheme]['selection_bg'],
    ansi = themes[config.color_scheme]['ansi'],
    brights = themes[config.color_scheme]['brights'],
    tab_bar = {
        background = themes[config.color_scheme]['tab_bar_bg'],
        active_tab = {
            bg_color = themes[config.color_scheme]['active_tab_bg'],
            fg_color = themes[config.color_scheme]['active_tab_fg'],
            intensity = 'Normal', -- Half, Normal, Bold
        },
        inactive_tab = {
            bg_color = themes[config.color_scheme]['tab_bg'],
            fg_color = themes[config.color_scheme]['tab_fg'],
        },
        inactive_tab_hover = {
            bg_color = themes[config.color_scheme]['tab_bg'],
            fg_color = themes[config.color_scheme]['tab_fg'],
        },
        new_tab = {
            bg_color = themes[config.color_scheme]['tab_bg'],
            fg_color = themes[config.color_scheme]['tab_fg'],
        },
        new_tab_hover = {
            bg_color = themes[config.color_scheme]['tab_bg'],
            fg_color = themes[config.color_scheme]['tab_fg'],
        },
    },
}

config.keys                           = {
    { key = "LeftArrow",  mods = "OPT",     action = wezterm.action { SendString = "\x1bb" } },
    { key = "RightArrow", mods = "OPT",     action = wezterm.action { SendString = "\x1bf" } },
    { key = 'q',          mods = 'CMD',     action = act.Nop, },
    { key = 'p',          mods = 'ALT',     action = act.ActivateKeyTable { name = 'pane', }, },
    { key = 'h',          mods = 'ALT',     action = act.ActivatePaneDirection 'Left', },
    { key = 'j',          mods = 'ALT',     action = act.ActivatePaneDirection 'Down', },
    { key = 'k',          mods = 'ALT',     action = act.ActivatePaneDirection 'Up', },
    { key = 'l',          mods = 'ALT',     action = act.ActivatePaneDirection 'Right', },
    { key = ',',          mods = 'ALT',     action = act.ActivateTabRelative(-1) },
    { key = '.',          mods = 'ALT',     action = act.ActivateTabRelative(1) },
    { key = ',',          mods = 'ALT|CMD', action = act.MoveTabRelative(-1) },
    { key = '.',          mods = 'ALT|CMD', action = act.MoveTabRelative(1) },
}

config.key_tables                     = {
    pane_resize = {
        { key = 'LeftArrow',  action = act.AdjustPaneSize { 'Left', 1 } },
        { key = 'h',          action = act.AdjustPaneSize { 'Left', 5 } },
        { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
        { key = 'l',          action = act.AdjustPaneSize { 'Right', 5 } },
        { key = 'UpArrow',    action = act.AdjustPaneSize { 'Up', 1 } },
        { key = 'k',          action = act.AdjustPaneSize { 'Up', 5 } },
        { key = 'DownArrow',  action = act.AdjustPaneSize { 'Down', 1 } },
        { key = 'j',          action = act.AdjustPaneSize { 'Down', 5 } },
        { key = 'Escape',     action = act.ClearKeyTableStack },
    },
    pane = {
        { key = 'p',      mods = 'ALT',                                                            action = 'PopKeyTable' },
        { key = 'v',      action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = 's',      action = act.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = 'Space',  action = act.PaneSelect },
        { key = 'Tab',    action = act.PaneSelect { mode = "SwapWithActive" } },
        { key = 't',      action = act.ShowTabNavigator },
        { key = 'n',      action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'r',      action = act.ActivateKeyTable { name = "pane_resize", one_shot = false } },
        { key = '0',      action = act.ClearScrollback 'ScrollbackAndViewport' },
        { key = 'z',      action = act.TogglePaneZoomState },
        { key = 'Escape', action = 'PopKeyTable' },
    },
}

wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, _hover, _max_width)
    local title = string.format(" %d ", tab.tab_index + 1)
    return title
end)

wezterm.on('update-right-status', function(window, pane)
    local name = window:active_key_table()
    if name then
        name = 'MODE: ' .. name
    end
    window:set_right_status(name or '')
end)

return config
