import 'package:es6_math/es6_math.dart';
import 'package:test/test.dart';

const double epsilon = 1e-10;

void main() {
  test('acosh', () {
    expect(acosh(1), 0);
    expect(acosh(2.5), closeTo(1.566799236972411, epsilon));
    expect(acosh(0.999999999999), isNaN);
    expect(acosh(double.infinity), double.infinity);
  });

  test('asinh', () {
    expect(asinh(0), 0);
    expect(asinh(2), 1.4436354751788103);
    expect(asinh(double.infinity), double.infinity);
  });

  test('atanh', () {
    expect(atanh(0), 0);
    expect(atanh(0.5), closeTo(0.549306144334055, epsilon));
    expect(atanh(1), double.infinity);
    expect(atanh(2), isNaN);
  });

  test('cbrt', () {
    expect(cbrt(2), closeTo(1.2599210498948732, epsilon));
    expect(cbrt(64), 4);
    expect(cbrt(-125), -5);
    expect(cbrt(117649), 49);
    expect(cbrt(double.infinity), double.infinity);
  });

  test('clz32', () {
    expect(clz32(0), 32);
    expect(clz32(0x7000), 17);
    expect(clz32(0xffffffff), 0);
  });

  test('cosh', () {
    expect(cosh(0), 1);
    expect(cosh(2), 3.7621956910836314);
    expect(cosh(double.infinity), double.infinity);
  });

  test('imul', () {
    expect(imul(3, 4), 12);
    expect(imul(-5, 12), -60);
    expect(imul(0xfffffffe, 5), -10);
  });

  test('expm1', () {
    expect(expm1(0), 0);
    expect(expm1(2), closeTo(6.38905609893065, epsilon));
    expect(expm1(double.infinity), double.infinity);
  });

  test('fround', () {
    expect(fround(5.5), 5.5);
    expect(fround(1.337), 1.3370000123977661);
  });

  test('hypot', () {
    expect(hypot([3, 4, 5]), closeTo(7.0710678118654755, epsilon));
  });

  test('log1p', () {
    expect(log1p(0), 0);
    expect(log1p(1), closeTo(0.6931471805599453, epsilon));
    expect(log1p(-1), double.negativeInfinity);
    expect(log1p(-2), isNaN);
  });

  test('log10', () {
    expect(log10(0), double.negativeInfinity);
    expect(log10(100000), 5);
    expect(log10(2), closeTo(0.3010299956639812, epsilon));
  });

  test('log2', () {
    expect(log2(0), double.negativeInfinity);
    expect(log2(2), 1);
    expect(log2(3), closeTo(1.584962500721156, epsilon));
  });

  test('sinh', () {
    expect(sinh(0), 0);
    expect(sinh(2), 3.626860407847019);
    expect(sinh(double.infinity), double.infinity);
  });

  test('tanh', () {
    expect(tanh(0), 0);
    expect(tanh(1), 0.7615941559557649);
    expect(tanh(double.infinity), 1);
  });

  test('trunc', () {
    expect(trunc(13.37), 13);
    expect(trunc(-42.84), -42);
    expect(() => trunc(double.infinity), throwsA(TypeMatcher<UnsupportedError>()));
  });
}