def update_keymaps [] {
    echo $"(ansi yellow)Updating keymaps...(ansi reset)"
    let parsed_keymap = (keymap --config config/diagrams/parsing.yaml parse --zmk-keymap config/chocofi.keymap)
    echo $"Finished parsing keymap ✅"

    let drawing_config_with_embedded_fonts = "drawing_config_with_embedded_fonts.yaml"
    open config/diagrams/drawing.yaml
        | upsert draw_config.svg_extra_style (open --raw config/diagrams/font_embed.css)
        | save --force $drawing_config_with_embedded_fonts

    [BASE, FN] | par-each {|layer|
        mut flags = [--select-layers, ($layer)]
        # currently, even with `select-layers`, keymap drawer draws the separated combo diagrams for all the layers
        # for now, this is not a huge problem, since I don't use combos on layers other than base
        # TODO: make MRE and create issue/pull-request upstream
        if $layer != BASE {
            $flags = ($flags ++ '--keys-only')
        }

        $parsed_keymap | keymap --config $drawing_config_with_embedded_fonts draw ...$flags -- - | str replace --all "\r" "" | save --raw --force $"diagrams/($layer).svg"
        echo $"Finished layer (ansi purple)($layer)(ansi reset)✅"
    }
    rm $drawing_config_with_embedded_fonts
    echo $"(ansi green)Keymaps updated ✅(ansi reset)"

}

def main [
    --watch # continuously update keymaps as soon as any relevant source file changes
] {
    if ($watch) {
        watch --verbose ./config {|op path new_path|
            echo $"(ansi purple)($path)(ansi reset) has been modified";
            # invoke the script without the --watch flag, instead of directly calling the update function
            # this way, we can get feedback while editing the update function itself
            nu config/diagrams/update.nu;
        }
    } else {
        update_keymaps
    }
}

