import 'dart:math';
import 'dart:typed_data';

/// Returns the inverse hyperbolic cosine of a number.
@pragma('vm:prefer-inline')
double acosh(num x) => log(x + sqrt(x*x-1));

/// Returns the inverse hyperbolic sine of a number.
@pragma('vm:prefer-inline')
double asinh(num x) => x.sign * log(x.abs() + sqrt(x*x+1));

/// Returns the inverse hyperbolic tangent of a number.
@pragma('vm:prefer-inline')
double atanh(num x) => log((1+x)/(1-x)) / 2;

const double _epsilon = 1e-10;

/// Returns the cube root of a number.
@pragma('vm:prefer-inline')
num cbrt(num x) {
  var y = pow(x.abs(), 1/3);
  // Cheating; try to make perfect cube roots accurate
  if (x == x.floorToDouble()) {
    final ceil = y.ceilToDouble();
    if (ceil - y <= _epsilon) y = ceil;
  }
  return x < 0 ? -y : y;
}

/// Returns the number of leading zero bits in the 32-bit binary representation of a number.
@pragma('vm:prefer-inline')
int clz32(int x) =>
    x == 0 ? 32 : 31 - (log(x >>> 0) * log2e).floor();

/// Returns the hyperbolic cosine of a number.
@pragma('vm:prefer-inline')
double cosh(num x) {
  final y = exp(x);
  return (y + 1 / y) / 2;
}

/// Returns the result of the C-like 32-bit multiplication of the two parameters.
@pragma('vm:prefer-inline')
int imul(int a, int b) {
  final ah = (a >>> 16) & 0xffff;
  final al = a & 0xffff;
  final bh = (b >>> 16) & 0xffff;
  final bl = b & 0xffff;
  // the shift by 0 fixes the sign on the high part
  return ((al * bl) + (((ah * bl + al * bh) << 16) >>> 0)).toSigned(32);
}

/// Returns e raised to the power of a number, subtracted by 1.
@pragma('vm:prefer-inline')
double expm1(num x) => exp(x) - 1;

/// Returns the nearest 32-bit single precision float representation of a number.
@pragma('vm:prefer-inline')
double fround(num x) {
  final list = Float32List(1);
  list[0] = x.toDouble();
  return list[0];
}

/// Returns the square root of the sum of squares of the values.
double hypot(Iterable<num> values) {
  double y = 0;
  for (final v in values) {
    if (v.isInfinite) return double.infinity;
    y += v * v;
  }
  return sqrt(y);
}

/// Returns the natural logarithm (base e) of `1 + x`.
@pragma('vm:prefer-inline')
double log1p(num x) => log(1 + x);

/// Returns the base 10 logarithm of a number.
@pragma('vm:prefer-inline')
double log10(num x) => log(x) * log10e;

/// Returns the base 2 logarithm of a number.
@pragma('vm:prefer-inline')
double log2(num x) => log(x) * log2e;

/// Returns the hyperbolic sine of a number.
@pragma('vm:prefer-inline')
double sinh(num x) {
  final y = exp(x);
  return (y - 1 / y) / 2;
}

/// Returns the hyperbolic tangent of a number.
@pragma('vm:prefer-inline')
double tanh(num x) {
  final a = exp(x), b = exp(-x);
  return a.isInfinite ? 1 : b.isInfinite ? -1 : (a - b) / (a + b);
}

/// Returns the integer part of a number by removing any fractional digits.
/// 
/// Throws an [UnsupportedError] if this number is not finite
/// (NaN or infinity).
@pragma('vm:prefer-inline')
double trunc(num x) {
  if (!x.isFinite) {
    throw UnsupportedError('Unsupported operation: trunc($x)');
  }
  return x > 0 ? x.floorToDouble() : x.ceilToDouble();
}

/// Loads the es6_math shared library.
/// 
/// Does nothing if the native version of the library is not imported.
void openEs6MathLibrary(String path) {}