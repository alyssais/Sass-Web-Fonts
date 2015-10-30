# Upgrade Guide

## Upgrading from 1.x to 2.x

The syntax for Sass Web Fonts has changed.

What would previously have been written:

```scss
@include web-fonts("Open Sans");
```

Should now be written:

```scss
@import url(web-fonts-url("Open Sans"));
```

This change was made to allow Sass Web Fonts to be used with [libsass](https://github.com/sass/libsass).

If you have a large project with lots of calls to `web-fonts()` that you don't want to replace by hand, you can replace any occurrence of `@import "web-fonts"` with `@import "web-fonts/compat"` to continue using the old syntax. However, it is recommended that you switch to using the new syntax at some point, because `web-fonts/compat` will be removed in a future release of the library.