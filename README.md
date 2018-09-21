Sass Web Fonts
==============

A Sass mixin to allow easy, efficient usage of [Google Web Fonts](https://www.google.com/fonts).

You can clone this repo and include [_web-fonts.scss](https://github.com/alyssais/Sass-Web-Fonts) in your project manually, or you can install the _sass-web-fonts_ package from [npm](https://www.npmjs.com) or [Bower](http://bower.io).

Upgrading from a previous version of Sass Web Fonts
---------------------------------------------------

Sass Web Fonts 2.x introduces breaking changes from 1.x. If you're upgrading from Sass Web Fonts 1.x, read the [upgrading guide](UPGRADING.md#upgrading-from-1x-to-2x). It's very easy. :)

Usage
-----
First, import Sass Web Fonts like this:

```scss
@import "web-fonts";
```

### Installing with npm and using a node-based task-runner

1. Add Sass-Web-Fonts as a dependency:

    ```bash
    npm install --save sass-web-fonts
    ```

1. You’ll need to add Sass-Web-Fonts to your node-sass `includePaths` option. Commonly in this way: `require("sass-web-fonts").includePaths`. But specifically you have to refer to the framework you are using.


#### With Grunt

```js
const sass = require( "node-sass" );

module.exports = function( grunt ) {
	require( "load-grunt-tasks" )( grunt );

	grunt.initConfig( {
		sass: {
			options: {
				implementation: sass,
				sourceMap: false,
				outputStyle: "compressed",
				sourceComments: false,

				includePaths: [
					//require( "module-one" ).includePaths,
					//require( "module-two" ).includePaths,
					require( "sass-web-fonts" ).includePaths
				]
			},
			public: {
				files: {
					"master.css": "master.scss"
				}
			}
		}
  } );
};
```

#### With Gulp

```js
var gulp = require( "gulp" );
var sass = require( "gulp-sass" );

gulp.task( "sass", function () {
  gulp.src( "input.scss" )
    .pipe( sass( {
      includePaths: require( "sass-web-fonts" ).includePaths
    } ) )
    .pipe( gulp.dest( "output.css" ) );
} );
```

### Using with [libsass](https://github.com/sass/libsass)

If you are using libsass, you can't pass the result of `web-fonts-url()` directly into `@import url()`. You have to store it in a variable first. This is due to the compiler not supporting importing urls from functions.

```scss
// This won't work with libsass
@import url(web-fonts-url("Open Sans"));

// This will work with libsass
$url: web-fonts-url("Open Sans");
@import url($url);
```

### Importing a single font

```scss
@import url(web-fonts-url("Open Sans"));
```

### Specifying font variant

```scss
@import url(web-fonts-url(("Open Sans": "bold")));
```

### Multiple variants

```scss
@import url(web-fonts-url(("Open Sans": ("500", "600 italic"))));
```

### Multiple fonts

```scss
@import url(web-fonts-url("Open Sans", ("Ubuntu": ("400", "italic"))));
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
@import url(web-fonts-url("Open Sans"); // uses HTTPS);
```

Extra parameters
----------------

To add additional parameters to the web fonts URL, you can override the `$web-fonts-params` variable with a map containing the extra URL params. For example, you can use it to specify character subsets:

```scss
$web-fonts-params: (subset: "latin,latin-ext");
@import url(web-fonts-url("Open Sans"));
```

```css
/* Generated CSS */
@import url("//fonts.googleapis.com/css?subset=latin%2Clatin-ext&family=Open%20Sans");
```

A list of available parameters can be found in the [Google Web Fonts documentation](https://developers.google.com/fonts/docs/getting_started).

Testing
-------

Development of this mixin uses [SassUnit](https://github.com/alyssais/SassUnit) for unit tests. To run the tests after making a change to the mixin, do this:

```sh
$ bundle install
$ bundle exec sassunit
```

[ ![Codeship Status for alyssais/Sass-Web-Fonts](https://codeship.com/projects/2137d480-5c3b-0132-1892-4a3e16d9def4/status)](https://codeship.com/projects/50754)

Troubleshooting
---------------

If you get a `Sass::SyntaxError` when using the library, you probably need to update Sass. See [issue #7](https://github.com/alyssais/Sass-Web-Fonts/issues/7) for more information.

---

_Requires Sass 3.3 or later version. Pull requests welcome._
