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
    config.font_size    = 10.5
end

config.window_decorations     = 'RESIZE'

config.use_fancy_tab_bar      = false
config.enable_tab_bar         = true

local themes                  = {}

local nord                    = {}
nord['foreground']            = "#d8dee9"
nord['background']            = "#2e3440"
nord['cursor_bg']             = "#eceff4"
nord['cursor_border']         = "#eceff4"
nord['cursor_fg']             = "#282828"
nord['selection_bg']          = "#eceff4"
nord['selection_fg']          = "#4c566a"
nord['ansi']                  = { "#3b4252", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#88c0d0", "#e5e9f0" }
nord['brights']               = { "#4c566a", "#bf616a", "#a3be8c", "#ebcb8b", "#81a1c1", "#b48ead", "#8fbcbb", "#eceff4" }
nord['tab_bar_bg']            = '#2E3440'
nord['active_tab_bg']         = '#81A1C1'
nord['active_tab_fg']         = '#2E3440'
nord['tab_bg']                = '#3B4252'
nord['tab_fg']                = '#D8DEE9'
themes['nord']                = nord

local nord_light              = {}
nord_light['foreground']      = "#414858"
nord_light['background']      = "#e5e9f0"
nord_light['cursor_bg']       = "#88c0d0"
nord_light['cursor_border']   = "#88c0d0"
nord_light['cursor_fg']       = "#3b4252"
nord_light['selection_bg']    = "#d8dee9"
nord_light['selection_fg']    = "#4c556a"
nord_light['ansi']            = { "#3b4252", "#bf616a", "#a3be8c", "#c87b2e", "#81a1c1", "#b48ead", "#88c0d0", "#a0a0a0" }
nord_light['brights']         = { "#4c566a", "#bf616a", "#a3be8c", "#c87b2e", "#81a1c1", "#b48ead", "#8fbcbb", "#a0a0a0" }
nord_light['tab_bar_bg']      = '#ECEFF4'
nord_light['active_tab_bg']   = '#81A1C1'
nord_light['active_tab_fg']   = '#ECEFF4'
nord_light['tab_bg']          = '#E5E9F0'
nord_light['tab_fg']          = '#434C5E'
themes['nord-light']          = nord_light

local dragon_light            = {}
dragon_light['foreground']    = "#1b1b1b"
dragon_light['background']    = "#E7E7E7"
dragon_light['cursor_bg']     = "#787878"
dragon_light['cursor_border'] = "#c8c8c8"
dragon_light['cursor_fg']     = "#eeeeee"
dragon_light['selection_bg']  = "#d8d8d8"
dragon_light['selection_fg']  = "#a0a0a0"
dragon_light['ansi']          = { "#1b1b1b", "#b73242", "#6a824f", "#c87b2e", "#658594", "#b1b1d2", "#658594", "#a0a0a0" }
dragon_light['brights']       = { "#1b1b1b", "#b73242", "#6a824f", "#c87b2e", "#658594", "#b1b1d2", "#658594", "#a0a0a0" }
dragon_light['tab_bar_bg']    = '#E7E7E7'
dragon_light['active_tab_bg'] = '#f6f6f6'
dragon_light['active_tab_fg'] = '#1b1b1b'
dragon_light['tab_bg']        = '#EEEEEE'
dragon_light['tab_fg']        = '#A2A2A2'
themes['dragon-light']        = dragon_light

config.colors                 = {
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

config.keys                   = {
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
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    table.insert(config.keys,
        { key = "LeftArrow", mods = "OPT", action = act.SendKey { key = 'LeftArrow', mods = 'CTRL' } })
    table.insert(config.keys,
        { key = "RightArrow", mods = "OPT", action = act.SendKey { key = 'RightArrow', mods = 'CTRL' } })
end

config.key_tables = {
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
        { key = 'Enter',      action = act.ClearKeyTableStack },
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
        { key = 'Enter',  action = 'PopKeyTable' },
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
