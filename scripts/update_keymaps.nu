def main [] {
    echo $"(ansi yellow)Updating keymaps...(ansi reset)"
    let parsed_keymap = (keymap --config "keymap_drawer_config.yaml" parse --zmk-keymap "config/chocofi.keymap")
    echo $"Parsing keymap done ✅"
    [BASE, FN] | par-each {|layer|
        mut flags = [--select-layers, ($layer)]
        # currently, even with `select-layers`, keymap drawer draws the separated combo diagrams for all the layers
        # for now, this is not a huge problem, since I don't use combos on layers other than base
        # TODO: make MRE and create issue/pull-request upstream
        if $layer != BASE {
            $flags = ($flags ++ '--keys-only')
        }

        $parsed_keymap | keymap --config "keymap_drawer_config.yaml" draw ...$flags -- - | save --raw --force $"($layer).svg"
        echo $"Finished layer (ansi purple)($layer)(ansi reset)✅"
    }
    echo $"(ansi green)Keymaps updated ✅(ansi reset)"
}

