export def main [] {
    const color_palette = {
        lotusRed0: "#d7474b"
        sumiInk6: "#b1b1d2"
        dragonRed: "#b23b34"
        dragonOrange1: "#825c45"
        waveRed: "#e46876"
        roninYellow: "#c87b2e"
        dragonGreen0: "#87a987"
        dragonTeal: "#445f96"
        dragonBlue0: "#658594"
        springViolet: "#938aa9"
        text: "#1b1b1b"
        overlay1: "#8c8fa1"
        overlay0: "#9ca0b0"
        base: "#e7e7e7"
    }

    return {
        separator: $color_palette.overlay0
        leading_trailing_space_bg: { attr: "n" }
        header: { fg: $color_palette.dragonBlue0 attr: "b" }
        empty: $color_palette.springViolet
        bool: $color_palette.springViolet
        int: $color_palette.waveRed
        duration: $color_palette.text
        filesize: {|e|
            if $e < 1mb {
                $color_palette.dragonGreen0
            } else if $e < 100mb {
                $color_palette.roninYellow
            } else if $e < 500mb {
                $color_palette.waveRed
            } else if $e < 800mb {
                $color_palette.dragonOrange1
            } else if $e > 800mb {
                $color_palette.dragonRed
            }
        }
        date: {|| (date now) - $in |
            if $in < 1hr {
                $color_palette.dragonGreen0
            } else if $in < 1day {
                $color_palette.roninYellow
            } else if $in < 3day {
                $color_palette.waveRed
            } else if $in < 1wk {
                $color_palette.dragonOrange1
            } else if $in > 1wk {
                $color_palette.dragonRed
            }
        }
        range: $color_palette.text
        float: $color_palette.text
        string: $color_palette.text
        nothing: $color_palette.text
        binary: $color_palette.text
        'cell-path': $color_palette.text
        row_index: { fg: $color_palette.sumiInk6 attr: "b" }
        record: $color_palette.text
        list: $color_palette.text
        block: $color_palette.text
        hints: $color_palette.overlay1
        search_result: { fg: $color_palette.dragonRed bg: $color_palette.text }

        shape_and: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_binary: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_block: { fg: $color_palette.dragonBlue0 attr: "b" }
        shape_bool: $color_palette.dragonTeal
        shape_custom: $color_palette.dragonGreen0
        shape_datetime: { fg: $color_palette.dragonTeal attr: "b" }
        shape_directory: $color_palette.dragonTeal
        shape_external: $color_palette.dragonTeal
        shape_externalarg: { fg: $color_palette.dragonGreen0 attr: "b" }
        shape_filepath: $color_palette.dragonTeal
        shape_flag: { fg: $color_palette.dragonBlue0 attr: "b" }
        shape_float: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_garbage: { fg: $color_palette.text bg: $color_palette.dragonRed attr: "b" }
        shape_globpattern: { fg: $color_palette.dragonTeal attr: "b" }
        shape_int: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_internalcall: { fg: $color_palette.dragonTeal attr: "b" }
        shape_list: { fg: $color_palette.dragonTeal attr: "b" }
        shape_literal: $color_palette.dragonBlue0
        shape_match_pattern: $color_palette.dragonGreen0
        shape_matching_brackets: { attr: "u" }
        shape_nothing: $color_palette.dragonTeal
        shape_operator: $color_palette.waveRed
        shape_or: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_pipe: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_range: { fg: $color_palette.waveRed attr: "b" }
        shape_record: { fg: $color_palette.dragonTeal attr: "b" }
        shape_redirection: { fg: $color_palette.lotusRed0 attr: "b" }
        shape_signature: { fg: $color_palette.dragonGreen0 attr: "b" }
        shape_string: $color_palette.dragonGreen0
        shape_string_interpolation: { fg: $color_palette.dragonTeal attr: "b" }
        shape_table: { fg: $color_palette.dragonBlue0 attr: "b" }
        shape_variable: $color_palette.lotusRed0

        background: $color_palette.base
        foreground: $color_palette.text
        cursor: $color_palette.dragonBlue0
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'
        
    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate
