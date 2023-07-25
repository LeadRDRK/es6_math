# ES6 Math
Provides math functions from ES6 (ECMAScript 2015) that are currently missing in `dart:math`. Mostly based on MDN polyfills (circa 2017). Useful for maintaining compatibility with code ported from JavaScript that make use of these functions.

Function list: `acosh`, `asinh`, `atanh`, `cbrt`, `clz32`, `cosh`, `imul`, `expm1`, `fround`, `hypot`, `log1p`, `log10`, `log2`, `sinh`, `tanh`, `trunc`.

## Native library
This library contains an extra native variant which replaces some functions with a native implementation. It slightly improves the performance and accuracy of those functions.

An implementation of the native library is available in `native_lib` which can be compiled into a shared library using either CMake or make. It's mostly a wrapper around the native C math library. You will have to manually configure your build system to compile the library.

Using conditional imports, one might want to use the native library if available. For example:
```dart
import 'dart:io';
import 'package:es6_math/es6_math.dart'
    if (dart.library.ffi) 'package:es6_math/es6_math_native.dart';

void main() {
  // Load the dynamic library
  if (Platform.isWindows) {
    loadEs6MathLibrary('es6_math.dll');
  }
  else if (Platform.isAndroid || Platform.isLinux) {
    loadEs6MathLibrary('libes6_math.so');
  }
  else if (Platform.isIOS || Platform.isMacOS) {
    loadEs6MathLibrary('libes6_math.dylib');
  }

  // Do some calculations...
  print(cbrt(512));
}
```

The `loadEs6MathLibrary` function is also defined in the vanilla variant of the library but it doesn't do anything, so it's safe to call it without even checking for it first.

# License
[MIT](LICENSE)