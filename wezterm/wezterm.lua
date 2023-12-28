local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme                           = 'nord-light'

config.font                                   = wezterm.font('FiraMono Nerd Font')
config.font                                   = wezterm.font('RobotoMono Nerd Font')
config.font_size                              = 14

config.window_decorations                     = 'RESIZE'

config.use_fancy_tab_bar                      = false
config.enable_tab_bar                         = true

local tab_bar_colors                          = {}
tab_bar_colors['nord']                        = {}
tab_bar_colors['nord']['background']          = '#2E3440'
tab_bar_colors['nord']['active_tab_bg']       = '#81A1C1'
tab_bar_colors['nord']['active_tab_fg']       = '#2E3440'
tab_bar_colors['nord']['tab_bg']              = '#3B4252'
tab_bar_colors['nord']['tab_fg']              = '#D8DEE9'
tab_bar_colors['nord-light']                  = {}
tab_bar_colors['nord-light']['background']    = '#ECEFF4'
tab_bar_colors['nord-light']['active_tab_bg'] = '#81A1C1'
tab_bar_colors['nord-light']['active_tab_fg'] = '#ECEFF4'
tab_bar_colors['nord-light']['tab_bg']        = '#E5E9F0'
tab_bar_colors['nord-light']['tab_fg']        = '#434C5E'
config.colors                                 = {
    tab_bar = {
        background = tab_bar_colors[config.color_scheme]['background'],
        active_tab = {
            bg_color = tab_bar_colors[config.color_scheme]['active_tab_bg'],
            fg_color = tab_bar_colors[config.color_scheme]['active_tab_fg'],
            intensity = 'Normal', -- Half, Normal, Bold
        },
        inactive_tab = {
            bg_color = tab_bar_colors[config.color_scheme]['tab_bg'],
            fg_color = tab_bar_colors[config.color_scheme]['tab_fg'],
        },
        inactive_tab_hover = {
            bg_color = tab_bar_colors[config.color_scheme]['tab_bg'],
            fg_color = tab_bar_colors[config.color_scheme]['tab_fg'],
        },
        new_tab = {
            bg_color = tab_bar_colors[config.color_scheme]['tab_bg'],
            fg_color = tab_bar_colors[config.color_scheme]['tab_fg'],
        },
        new_tab_hover = {
            bg_color = tab_bar_colors[config.color_scheme]['tab_bg'],
            fg_color = tab_bar_colors[config.color_scheme]['tab_fg'],
        },
    },
}

config.keys                                   = {
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

config.key_tables                             = {
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
