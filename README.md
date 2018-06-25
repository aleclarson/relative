# relative v0.0.1

Ultra fast relative path resolver ⚡️

```js
relative('a/b', './c')    // => 'a/c'
relative('a/b', '.')      // => 'a'
relative('a/b', '..')     // => ''
relative('a/b', '../..')  // => null
```

The first argument is known as "the module".

The second argument is known as "the relative".

The relative must begin with a period. Otherwise, `null` is returned.

The basename of the module is always ignored.

When the module is *not* absolute and the relative is pointing to the root directory, an empty string is returned.

When the module is *not* absolute and the relative is pointing outside the root directory, `null` is returned.

