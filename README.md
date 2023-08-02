My personal zmk config for the [chocofi](https://github.com/pashutk/chocofi)

![keymap](./chocofi.svg)

## Autopair
Bracket and quotation symbols have `autopair` functionality on hold.
This functionality types a pair of such symbols, then steps back in between them.
By holding down `shift` as well, additional `space` padding is added inside.
By holding down `control` instead, the inside is padded with `return`.
This is extremely convenient for quickly opening scopes using `{}`, or markdown code blocks.

This kind of functionality is normally available through text editor plugins but I never used it personally because I find that I often run into cases where I **don't** want this functionality to kick in.
So having it optional, and activated manually is more convenient to me.
Also, this makes this feature available anywhere where arrow key navigation works.

## Acknowledgements

Alpha layout is [hands-down gold](https://sites.google.com/alanreiser.com/handsdown/home/hands-down-neu#h.8i2msuo3butx), with slight tweaks to the locations of the letter and bigram combos:
 - All bigrams are on the left side of the keyboard since they are all either surrounded by, or preceeded by vowels, and typing a combo in 
 rapid succesion with a vowel is hard for me.
 - The `Z` combo is moved down. Typing the upper ring finger + pinky combo is not comfortable for my hands
 - The `Qu` combo was initially a hold-tap with `Qu` on tap and `Q` on hold. This is perfect when typing prose, I found that I only needed 
 `Q` for initialism, and the hold-delay was not a problem for me. However, `Q` is a very common key in vim/nvim and it quickly became annoying
 having to hold the combo every time I needed to exit a dialog or close a window. `Qt` codebases are also painful to work in when having `Q` on hold.
 So `Q` and `Qu` have been split into adjacent combos, maintaining the best of both worlds.

Chocofi board definition taken from [infused-kim](https://github.com/infused-kim/zmk-config)

Uses [urob's zmk fork](https://github.com/urob/zmk), as well as his parameters for [timerless homerow mods](https://github.com/urob/zmk-config#timeless-homerow-mods)

SVG keymaps are auto-generated using [keymap-drawer](https://github.com/caksoylar/keymap-drawer)

The keymap diagrams contain svgs using nerdfont icons. These svgs have been generated using this [text to svg converter](https://danmarshall.github.io/google-font-to-svg-path/) with the [JetBrainsMonoNerdFont-Medium.ttf](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip) uploaded. A stroke width of 0.1mm seems to provide good results. After you have your svg, remove the added `<g id="svgGroup"...` element, to allow the glyphs to take on the config's colors.

Color palette used in the keymap SVGs is [kanagawa](https://github.com/rebelot/kanagawa.nvim/)

Comments in *.keymap files are auto-generated and auto-indented using [qmk.nvim](https://github.com/codethread/qmk.nvim)
