local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font         = wezterm.font_with_fallback{{ family = 'RobotoMono Nerd Font', weight = "Medium"}, 'Symbols Nerd Font Mono'}
config.font_size    = 14
config.warn_about_missing_glyphs = false

config.front_end    = "WebGpu"
config.window_decorations     = 'RESIZE'
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    config.default_prog = { 'nu.exe' }
    config.font_size    = 10.5
elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    config.font_size    = 11.5
    config.window_decorations     = 'NONE'
end

config.use_fancy_tab_bar      = false
config.enable_tab_bar         = true

local selected_theme = 'dragon-light'
local themes = {}
themes['nord'] = require("themes/nord")
themes['nord-light'] = require("themes/nord-light")
themes['dragon-light'] = require("themes/dragon-light")
config.colors                 = {
    foreground = themes[selected_theme]['foreground'],
    background = themes[selected_theme]['background'],
    cursor_fg = themes[selected_theme]['cursor_fg'],
    cursor_bg = themes[selected_theme]['cursor_bg'],
    selection_fg = themes[selected_theme]['selection_fg'],
    selection_bg = themes[selected_theme]['selection_bg'],
    ansi = themes[selected_theme]['ansi'],
    brights = themes[selected_theme]['brights'],
    tab_bar = {
        background = themes[selected_theme]['tab_bar_bg'],
        active_tab = {
            bg_color = themes[selected_theme]['active_tab_bg'],
            fg_color = themes[selected_theme]['active_tab_fg'],
            intensity = 'Normal', -- Half, Normal, Bold
        },
        inactive_tab = {
            bg_color = themes[selected_theme]['tab_bg'],
            fg_color = themes[selected_theme]['tab_fg'],
        },
        inactive_tab_hover = {
            bg_color = themes[selected_theme]['tab_bg'],
            fg_color = themes[selected_theme]['tab_fg'],
        },
        new_tab = {
            bg_color = themes[selected_theme]['tab_bg'],
            fg_color = themes[selected_theme]['tab_fg'],
        },
        new_tab_hover = {
            bg_color = themes[selected_theme]['tab_bg'],
            fg_color = themes[selected_theme]['tab_fg'],
        },
    },
}

local function nvim_passthrough(key, mods, wezterm_action)
    local action = wezterm.action_callback(function (win, pane)
        if pane:get_user_vars().IS_NVIM == 'true' then
            win:perform_action({ SendKey = {key = key, mods = mods} }, pane)
        else
            win:perform_action( wezterm_action, pane)
        end
    end)
    return { key = key, mods = mods, action = action, }
end

config.keys                   = {
    { key = "LeftArrow",  mods = "OPT",     action = wezterm.action { SendString = "\x1bb" } },
    { key = "RightArrow", mods = "OPT",     action = wezterm.action { SendString = "\x1bf" } },
    { key = 'q',          mods = 'CMD',     action = act.Nop, },
    { key = 'p',          mods = 'ALT',     action = act.ActivateKeyTable { name = 'pane', }, },
    { key = '.',          mods = 'CTRL',    action = act.RotatePanes 'CounterClockwise' },
    { key = ',',          mods = 'CTRL',    action = act.RotatePanes 'Clockwise' },
    { key = ',',          mods = 'ALT|CMD',  action = act.ActivateTabRelative(-1) },
    { key = '.',          mods = 'ALT|CMD',  action = act.ActivateTabRelative(1) },
    nvim_passthrough('h', 'ALT', { ActivatePaneDirection = 'Left' } ),
    nvim_passthrough('j', 'ALT', { ActivatePaneDirection = 'Down' }),
    nvim_passthrough('k', 'ALT', { ActivatePaneDirection = 'Up' }),
    nvim_passthrough('l', 'ALT', { ActivatePaneDirection = 'Right' }),
    nvim_passthrough('h', 'CTRL', { AdjustPaneSize = {'Left',1} } ),
    nvim_passthrough('j', 'CTRL', { AdjustPaneSize = {'Down',1} }),
    nvim_passthrough('k', 'CTRL', { AdjustPaneSize = {'Up',1} }),
    nvim_passthrough('l', 'CTRL', { AdjustPaneSize = {'Right',1} }),
    nvim_passthrough(',', 'ALT', act.ActivateTabRelative(-1) ),
    nvim_passthrough('.', 'ALT', act.ActivateTabRelative(1) ),
    nvim_passthrough(',', 'ALT|CTRL', act.MoveTabRelative(-1) ),
    nvim_passthrough('.', 'ALT|CTRL', act.MoveTabRelative(1) ),
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
        { key = 'p',      mods = 'ALT', action = 'PopKeyTable' },
        { key = 'v',                    action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = 's',                    action = act.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = 'Space',                action = act.PaneSelect },
        { key = 'Tab',                  action = act.PaneSelect { mode = "SwapWithActive" } },
        { key = 't',                    action = act.ShowTabNavigator },
        { key = 'n',                    action = act.SpawnTab 'CurrentPaneDomain' },
        { key = 'r',                    action = act.ActivateKeyTable { name = "pane_resize", one_shot = false } },
        { key = '0',                    action = act.ClearScrollback 'ScrollbackAndViewport' },
        { key = 'z',                    action = act.TogglePaneZoomState },
        { key = 'Escape',               action = 'PopKeyTable' },
        { key = 'Enter',                action = 'PopKeyTable' },
    },
}

wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, _hover, _max_width)
    local title
    if tab.active_pane.is_zoomed then
        title = string.format("[%d]", tab.tab_index + 1)
    else
        title = string.format(" %d ", tab.tab_index + 1)
    end
    return title
end)

wezterm.on('update-status', function(window, pane)
    local name = window:active_key_table()
    local display_name = ''
    local fg, bg
    if name == 'pane' then
        bg = config.colors.ansi[3]
        fg = config.colors.background
        display_name = '   PANE   '
    elseif name == 'pane_resize' then
        bg = config.colors.ansi[4]
        fg = config.colors.background
        display_name = ' P-RESIZE '
    elseif name == 'copy_mode' then
        bg = config.colors.ansi[2]
        fg = config.colors.background
        display_name = '   COPY   '
    elseif name == 'search_mode' then
        bg = config.colors.ansi[5]
        fg = config.colors.background
        display_name = '  SEARCH  '
    else
        bg = themes[selected_theme]['active_tab_bg']
        fg = themes[selected_theme]['active_tab_fg']
        display_name = '  NORMAL  '
    end
    local mode = wezterm.format{
        { Background = { Color = bg } },
        { Foreground = { Color = fg } },
        { Text = display_name }
    }
    window:set_left_status(mode)
    local cwd = pane:get_current_working_dir()
    if cwd then
        window:set_right_status(' ' .. pane:get_current_working_dir().file_path .. ' ')
    end
end)

return config
