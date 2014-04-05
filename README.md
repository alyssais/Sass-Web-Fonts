Sass Web Fonts
==============

A Sass mixin to allow easy, efficient usage of [Google Web Fonts](https://google.com/webfonts).

Usage
-----

### Importing a single font

```scss
@include web-fonts("Open Sans");
```

### Specifying font variant

```scss
@include web-fonts(("Open Sans": "bold"));
```

### Multiple variants

```scss
@include web-fonts(("Open Sans": ("500", "600 italic")));
```

### Multiple fonts

```scss
@include web-fonts("Open Sans", ("Ubuntu": ("400", "italic")));
```

Protocols
---------

By default, the `web-fonts` mixin will attempt to load fonts with the same
protocol that was used to access the stylesheet it was called in. However,
in some circumstances, most notably when the stylesheet was loaded as a local
file (using a file:// url), this will not work. In this situation, it is
possible to override the automatic protocol detection by setting the
`$web-fonts-protocol` variable prior to calling the mixin.

### Example

```scss
$web-fonts-protocol: "https"; // fonts will be loaded over HTTPS from here on.
@include web-fonts("Open Sans"); // uses HTTPS;
```

_Requires Sass 3.3 or later version. Pull requests welcome._
