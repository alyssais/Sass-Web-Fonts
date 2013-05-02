web-fonts.scss
==============

A Sass mixin to allow easy, efficient usage of [https://google.com/webfonts](Google Web Fonts).
Supports all feautures of Google Web Fonts.
Google Web Fonts documentation is available [https://developers.google.com/webfonts/docs/getting_started](here).

Usage
-----

### Example ###
```SCSS
@include web-font((Tangerine, Open Sans), (italic bolditalic bold, i), (latin, cyrillic), ('thisismytext'), (shadow multiple, float 3d), true);
```

The @mixin takes six parameters, Font Families, Variants, Subsets, Characters, Effects and a Secure boolean.
Each parameter except Secure is enclosed in brackets, as they are Sass lists.
Font Families is the only required paramater, and all others can be bypassed by using `()`, except the Secure flag which can be left empty.

### In-depth Parameter Guide ###

#### Font Families ####

The Font Families parameter takes a comma-seperated list of fonts to include.
It is important not to use any quotes in this parameter.

This parameter is the only parameter which is non-optional.

#### Variants ####

The variants parameter takes a comma-seperated list of font-variants. Each item in the list is applied to the font with the same index in the Fonts parameter.

In the example below, the _Tangerine_ font includes both the _italic_ and ___bolditalic___ variants, the _Open Sans_ font includes the __bold__ and __800-weight__ variants, and the _Damion_ font includes no special-variants, and only includes the default version of that font.

```SCSS
@include web-font((Tangerine, Open Sans, Damion), (italic bolditalic, b 800));
```

It is important not to use any quotes in this parameter.

The supported variants are _italic_, __bold__, and ___bolditalic___, which can be abbreviated to _i_, __b__, ___bi___, as well as numeric font weights.

#### Subsets ####

The Subsets parameter allows you to request only specific scripts of each font. Subsets are specified in a comma-seperated list.
This parameter applies to all fonts requested by the current @mixin, as Google Web Fonts does not allow per-font subsets.

It is important not to use any quotes in this parameter.

#### Characters ####

The Characters parameter takes a string containing all the characters that you want to use with all of the fonts you include. (Google Web Fonts does not currently allow you to specify characters on a per-font basis.)

It is important to note that any special characters must be URL-encoded. For convenience, web-fonts.scss will automatically add %20 (a URL-encoded space character) to your characters parameter.

#### Font Effects ####

The Font Effects parameter takes a comma-separated list of Google Web Fonts font effects for use with your fonts. Documentation on the Google Web Fonts font effects is available [https://developers.google.com/webfonts/docs/getting_started#Effects](here).

In the case that the name a Font Effect is made up of more than one word, multiple words can be separated by either spaces or hyphens.

The font effects are applied to all fonts, as Google Web Fonts does not currently allow you to specify font effects on a per-font basis.

It is important not to use any quotes in this parameter.

#### Secure Protocols ####

By default, fonts are loaded using http. If you need them to be loaded using https, you will need to send the mixin a value of _true_ for the secure paramater. The example below will include Open Sans font, loading it via https.

```SCSS
@include web-font((Open Sans), $secure: true);
```


Known Issues and Possible Future Additions
------------------------------------------

- web-fonts.scss cannot URL-encode characters in the Characters parameter.
