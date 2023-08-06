My personal zmk config for the [chocofi](https://github.com/pashutk/chocofi)

SVG keymap is auto-generated using [keymap-drawer](https://github.com/caksoylar/keymap-drawer):

![keymap](./chocofi.svg)

# Base Layer
## Alphas
Alpha layout is [hands-down gold](https://sites.google.com/alanreiser.com/handsdown/home/hands-down-neu#h.8i2msuo3butx), with slight tweaks to the locations of the letter and bigram combos:
 - All bigrams are on the left side of the keyboard since they are all either surrounded by, or preceeded by vowels, and typing a combo in rapid succesion with a vowel is hard for me.
 This also makes room for all symbol combos on the right side
 - The `Qu` combo was initially a hold-tap with `Qu` on tap and `Q` on hold. This is perfect when typing prose, I found that I only needed `Q` for initialisms, and the hold-delay was not a problem for me.
 However, `Q` is a very common key in vim/nvim and it quickly became annoying having to hold the combo every time I needed to exit a dialog or close a window.
 `Qt` codebases are also painful to work in when having `Q` on hold.
 So `Q` and `Qu` have been split into adjacent combos, maintaining the best of both worlds.

Tapping bigrams uses different casing depending on the modifier held:
 - no modifier -> lowercase (e.g. `th`)
 - `shift` -> uppercase (`Th`)
 - `control` -> all caps (`TH`)

## Symbols
Symbols are changed form the original `hands-down gold`, mostly to group and arange them by easy to memorize rules, while still thinking about ergonomics:
 - most math symbols are on the inner index column of keys, with the equal sign being on the homerow middle + ring finger combo. this makes common `*=`, `-=`, `/=` etc bigrams more comfortable to type when programming, by avoiding using the same finger for both symbols. the only symbols from this category that are not on the inner column are the logical operators `~`, and `^`
 - sentence/statement ending punctuation symbols are all on the top row
 - quotation symbols that normally appear in pairs are all (except for `'` in prose) on the ring + pinky column of combos
 - the 4 bracket types are arranged in a rectangle, typed with the 3 strongest fingers: index, middle, and ring. The angle brackets and the square brackets are placed on the two stronger combos of the four (index + middle finger), since the square brackets are regulary used in vim for 'prev/next' jumps, and the angle brackets double as mathematical operators as well. Also, the `->` bigram is extremely common in C++
 .
 - `_` and `\` receive the most comfortable combo position, since they are among the most common symbols accross all the programming languages I use. The need to manually type `_` may be reduced in the future by implementing something like [x-case with `_` replacing `space`](https://github.com/andrewjrae/kyria-keymap/tree/e3ad77dc4d48b8e6a842c9136c76c1021ab5976b#x-case). If that proves viable I'll reconsider this symbol arrangement

### Autopair
Bracket and quotation symbols have `autopair` functionality on hold with the following behaviors:
 - hold without any modifier -> types a pair of such symbols (opening and closing symbol for brackets, or the same symbol doubled, for quotation symbols), then steps back in between them using the left arrow key
 - hold + `shift` -> additional `space` padding is added inside. The cursor ends up in between the spaces
 - hold + `control` -> the inside is padded with `return` instead. This is extremely convenient for quickly opening scopes using `{}`, or markdown code blocks. The cursor will end up on a new line, with the opening symbol above it, and the closing symbol below it

This kind of functionality is normally available through text editor plugins but I never used it personally because I find that I often run into cases where I **don't** want this functionality to kick in.
So having it optional, and activated manually is more convenient to me.
Also, this makes this feature available anywhere arrow key navigation works.
What's a bit annoying is having to step out of the pair created (have to type right arrow key). That might be fixed by making the arrow keys available on comfortable base layer combos.

### Sentence case
The sentence ending symbols (`.`, `!`, and `?`) can be held to trigger sentence case: the symbol itself will be emitted, then a space, and finally sticky shift will be activated, automatically turning the next letter uppercase.
The sticky shift is set to only deactivate after 10s if no input is received, to allow for a slight pause before the next sentence, if needed.

## Numbers
I hate switching layers, so I am currently experimenting with numbers on vertical (same finger) base layer combos. I am finding it difficult to get used to the same-finger combos, but will give this a try for a while. Otherwise, might put the numbers on diagonal combos (neighbouring fingers). However, that will tip the keymap diagram into the 'categorically incomprehensible' zone.

# Lock Layer
The `LOCK` layer is used when travelling to prevent accidental keytaps, since ZMK does not have a power on/off behavior. Since it's (de)activated using 8 fingers, it should be very unlikely to go back to the base layer and send random keytaps, while in a bag.

# ZMK tricks
If you have a custom hold-tap behavior that does not need any arguments and you don't want to have to pass `0 0` in your keymap to bind it, you can wrap it in a macro that uses [`macro_pause_for_release`](https://zmk.dev/docs/behaviors/macros#processing-continuation-on-release):

```c
#define BIND_HOLD_TAP_ARGUMENTS(NAME, HOLD_TAP_BEHAVIOR, ARGUMENT_1, ARGUMENT_2) \
/ { \
    macros { \
        NAME##: NAME { \
            label = #NAME; \
            compatible = "zmk,behavior-macro"; \
            #binding-cells = <0>; \
            wait-ms = <0>; \
            tap-ms = <0>; \
            bindings = <&macro_press & ## HOLD_TAP_BEHAVIOR ARGUMENT_1 ARGUMENT_2>, <&macro_pause_for_release>, <&macro_release & ## HOLD_TAP_BEHAVIOR ARGUMENT_1 ARGUMENT_2>; \
        }; \
    }; \
}
```

# Acknowledgements

Chocofi board definition taken from [infused-kim](https://github.com/infused-kim/zmk-config)

Uses [urob's zmk fork](https://github.com/urob/zmk), as well as his parameters for [timerless homerow mods](https://github.com/urob/zmk-config#timeless-homerow-mods)

The keymap diagrams contain svgs using nerdfont icons. These svgs have been generated using this [text to svg converter](https://danmarshall.github.io/google-font-to-svg-path/) with the [JetBrainsMonoNerdFont-Medium.ttf](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip) uploaded. A stroke width of 0.1mm seems to provide good results. After you have your svg, remove the added `<g id="svgGroup"...` element, to allow the glyphs to take on the config's colors.

Color palette used in the keymap SVGs is [kanagawa](https://github.com/rebelot/kanagawa.nvim/)
