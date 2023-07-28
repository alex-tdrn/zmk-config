My personal zmk config for the [chocofi](https://github.com/pashutk/chocofi)

![keymap](./chocofi.svg)

## Acknowledgements

Alpha layout is [hands-down gold](https://sites.google.com/alanreiser.com/handsdown/home/hands-down-neu#h.8i2msuo3butx), with slight tweaks to the locations of the `Z` and `Qu` combos.

Chocofi board definition taken from [infused-kim](https://github.com/infused-kim/zmk-config)

Uses [urob's zmk fork](https://github.com/urob/zmk), as well as his parameters for [timerless homerow mods](https://github.com/urob/zmk-config#timeless-homerow-mods)

SVG keymaps are auto-generated using [keymap-drawer](https://github.com/caksoylar/keymap-drawer)

The keymap diagrams contain svgs using nerdfont icons. These svgs have been generated using this [text to svg converter](https://danmarshall.github.io/google-font-to-svg-path/) with the [JetBrainsMonoNerdFont-Medium.ttf](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip) uploaded. A stroke width of 0.1mm seems to provide good results. After you have your svg, remove the added `<g id="svgGroup"...` element, to allow the glyphs to take on the config's colors.

Color palette used in the keymap SVGs is [kanagawa](https://github.com/rebelot/kanagawa.nvim/)

Comments in *.keymap files are auto-generated and auto-indented using [qmk.nvim](https://github.com/codethread/qmk.nvim)
