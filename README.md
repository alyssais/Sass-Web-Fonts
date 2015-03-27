Sass Web Fonts
==============

A Sass mixin to allow easy, efficient usage of [Google Web Fonts](https://google.com/webfonts).

You can clone this repo and include [_web-fonts.scss](https://github.com/penman/Sass-Web-Fonts) in your project manually, or you can install the _sass-web-fonts_ package from [Bower](http://bower.io).

Usage
-----
First, import Sass Web Fonts like this:

```scss
@import "web-fonts";
```

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

Extra parameters
----------------

To add additional parameters to the web fonts URL, you can override the `$web-fonts-params` variable with a map containing the extra URL params. For example, you can use it to specify character subsets:

```scss
$web-fonts-params: (subset: "latin,latin-ext");
@include web-fonts("Open Sans");
```

```css
/* Generated CSS */
@import url("//fonts.googleapis.com/css?subset=latin%2Clatin-ext&family=Open%20Sans");
```

A list of available parameters can be found in the [Google Web Fonts documentation](https://developers.google.com/fonts/docs/getting_started).

Testing
-------

Development of this mixin uses [SassUnit](https://github.com/penman/SassUnit) for unit tests. To run the tests after making a change to the mixin, do this:

```sh
$ bundle install
$ bundle exec sassunit
```

[ ![Codeship Status for penman/Sass-Web-Fonts](https://codeship.com/projects/2137d480-5c3b-0132-1892-4a3e16d9def4/status)](https://codeship.com/projects/50754)

Troubleshooting
---------------

If you get a `Sass::SyntaxError` when using the library, you probably need to update Sass. See [issue #7](https://github.com/penman/Sass-Web-Fonts/issues/7) for more information.

---
_Requires Sass 3.3 or later version. **[Not compatible with libsass.](https://github.com/penman/Sass-Web-Fonts/issues/14)** Pull requests welcome._

[You can follow me on Twitter.](https://twitter.com/PenmanRoss)
