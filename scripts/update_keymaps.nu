def main [] {
    echo $"(ansi yellow)Updating keymaps...(ansi reset)"
    let parsed_keymap = (keymap --config "keymap_drawer_parsing_config.yaml" parse --zmk-keymap "config/chocofi.keymap")
    echo $"Parsing keymap done ✅"

    let drawing_config_with_embedded_fonts = "drawing_config_with_embedded_fonts.yaml"
    open keymap_drawer_drawing_config.yaml
        | upsert draw_config.svg_extra_style (open --raw font_embed.css)
        | save --force $drawing_config_with_embedded_fonts

    [BASE, FN] | par-each {|layer|
        mut flags = [--select-layers, ($layer)]
        # currently, even with `select-layers`, keymap drawer draws the separated combo diagrams for all the layers
        # for now, this is not a huge problem, since I don't use combos on layers other than base
        # TODO: make MRE and create issue/pull-request upstream
        if $layer != BASE {
            $flags = ($flags ++ '--keys-only')
        }

        $parsed_keymap | keymap --config $drawing_config_with_embedded_fonts draw ...$flags -- - | str replace --all "\r" "" | save --raw --force $"($layer).svg"
        echo $"Finished layer (ansi purple)($layer)(ansi reset)✅"
    }
    rm $drawing_config_with_embedded_fonts
    echo $"(ansi green)Keymaps updated ✅(ansi reset)"
}

