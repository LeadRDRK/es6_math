import 'dart:ffi' as ffi;
import 'math.dart' as vanilla;

typedef _FfiDoubleDoubleFn = ffi.Double Function(ffi.Double);
typedef _FfiIntUintFn = ffi.Int32 Function(ffi.Uint32);
typedef _FfiImulFn = ffi.Int32 Function(ffi.Int32, ffi.Int32);
typedef _FfiFloatDoubleFn = ffi.Float Function(ffi.Double);

typedef _DoubleDoubleFn = double Function(double);
typedef _IntUintFn = int Function(int);
typedef _ImulFn = int Function(int, int);
typedef _FloatDoubleFn = double Function(double);

_DoubleDoubleFn _acosh = vanilla.acosh;
_DoubleDoubleFn _asinh = vanilla.asinh;
_DoubleDoubleFn _atanh = vanilla.atanh;
_DoubleDoubleFn _cbrt = (x) => vanilla.cbrt(x).toDouble();
_IntUintFn _clz32 = vanilla.clz32;
_DoubleDoubleFn _cosh = vanilla.cosh;
_ImulFn _imul = vanilla.imul;
_FloatDoubleFn _fround = vanilla.fround;
_DoubleDoubleFn _sinh = vanilla.sinh;
_DoubleDoubleFn _tanh = vanilla.tanh;

/// Returns the inverse hyperbolic cosine of a number.
@pragma('vm:prefer-inline')
double acosh(num x) => _acosh(x.toDouble());

/// Returns the inverse hyperbolic sine of a number.
@pragma('vm:prefer-inline')
double asinh(num x) => _asinh(x.toDouble());

/// Returns the inverse hyperbolic tangent of a number.
@pragma('vm:prefer-inline')
double atanh(num x) => _atanh(x.toDouble());

/// Returns the cube root of a number.
@pragma('vm:prefer-inline')
num cbrt(num x) => _cbrt(x.toDouble());

/// Returns the number of leading zero bits in the 32-bit binary representation of a number.
@pragma('vm:prefer-inline')
int clz32(int x) => x == 0 ? 32 : _clz32(x);

/// Returns the hyperbolic cosine of a number.
@pragma('vm:prefer-inline')
double cosh(num x) => _cosh(x.toDouble());

/// Returns the result of the C-like 32-bit multiplication of the two parameters.
@pragma('vm:prefer-inline')
int imul(int a, int b) => _imul(a, b);

/// Returns the nearest 32-bit single precision float representation of a number.
@pragma('vm:prefer-inline')
double fround(num x) => _fround(x.toDouble());

/// Returns the hyperbolic sine of a number.
@pragma('vm:prefer-inline')
double sinh(num x) => _sinh(x.toDouble());

/// Returns the hyperbolic tangent of a number.
@pragma('vm:prefer-inline')
double tanh(num x) => _tanh(x.toDouble());

/// Loads the es6_math shared library.
/// 
/// Does nothing if the native version of the library is not imported.
void openEs6MathLibrary(String path) {
  final lib = ffi.DynamicLibrary.open(path);
  _acosh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_acosh').asFunction(isLeaf: true);
  _asinh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_asinh').asFunction(isLeaf: true);
  _atanh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_atanh').asFunction(isLeaf: true);
  _cbrt = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_cbrt').asFunction(isLeaf: true);
  _clz32 = lib.lookup<ffi.NativeFunction<_FfiIntUintFn>>('es6_clz32').asFunction(isLeaf: true);
  _cosh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_cosh').asFunction(isLeaf: true);
  _imul = lib.lookup<ffi.NativeFunction<_FfiImulFn>>('es6_imul').asFunction(isLeaf: true);
  _fround = lib.lookup<ffi.NativeFunction<_FfiFloatDoubleFn>>('es6_fround').asFunction(isLeaf: true);
  _sinh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_sinh').asFunction(isLeaf: true);
  _tanh = lib.lookup<ffi.NativeFunction<_FfiDoubleDoubleFn>>('es6_tanh').asFunction(isLeaf: true);
}