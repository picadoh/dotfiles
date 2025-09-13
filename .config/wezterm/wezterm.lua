local wezterm = require("wezterm")
local act = wezterm.action

local theme_name = "catppuccin-mocha"

local theme = {
    name = theme_name,
    colors = wezterm.color.get_builtin_schemes()[theme_name]
}

local font = {
    name = "Hack Nerd Font Mono",
    weight = "Regular",
    size = 12.5,
}

local config = {
    --default_prog = {"/bin/zsh", "--login", "-c", "tmux new-session -A -s main"},
    automatically_reload_config = true,
    audible_bell = "Disabled",
    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    hide_tab_bar_if_only_one_tab = true,
    use_fancy_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    send_composed_key_when_left_alt_is_pressed = true,
    send_composed_key_when_right_alt_is_pressed = true,
    color_scheme = theme.name,
    font = wezterm.font(font.name, { weight = font.weight }),
    font_size = font.size,
    --window_background_opacity = 0.90,
    --macos_window_background_blur = 20,
    scrollback_lines = 50000,
    enable_scroll_bar = false,
    initial_rows = 50,
    initial_cols = 150,
    window_frame = {
        font_size = font.size + 1,
    },
    keys = {
        { key = "LeftArrow",  mods = "OPT",         action = act { SendString = "\x1bb" } },
        { key = "RightArrow", mods = "OPT",         action = act { SendString = "\x1bf" } },
        { key = 'k',          mods = 'SUPER',       action = act.ClearScrollback 'ScrollbackAndViewport' },
        { key = 'k',          mods = 'SUPER|SHIFT', action = act.ClearScrollback 'ScrollbackAndViewport' },
        { key = 'w',          mods = 'SUPER',       action = act.CloseCurrentPane { confirm = false } },
        { key = 'd',          mods = 'SUPER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
        { key = 'd',          mods = 'SUPER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    },
}

return config
