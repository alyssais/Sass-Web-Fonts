web-fonts.scss
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

_Requires Sass 3.3 or later version. Pull requests welcome._
