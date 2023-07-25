#include <math.h>
#include <stdint.h>

#if defined _WIN32 || defined __CYGWIN__
#   ifdef es6_math_EXPORTS
#       ifdef __GNUC__
#           define DLL_PUBLIC __attribute__ ((dllexport))
#       else
#           define DLL_PUBLIC __declspec(dllexport)
#       endif
#   else
#       ifdef __GNUC__
#           define DLL_PUBLIC __attribute__ ((dllimport))
#       else
#           define DLL_PUBLIC __declspec(dllimport)
#       endif
#   endif
#else
#   if __GNUC__ >= 4
#       define DLL_PUBLIC __attribute__ ((visibility ("default")))
#   else
#       define DLL_PUBLIC
#   endif
#endif

DLL_PUBLIC double es6_acosh(double x) {
    return acosh(x);
}

DLL_PUBLIC double es6_asinh(double x) {
    return asinh(x);
}

DLL_PUBLIC double es6_atanh(double x) {
    return atanh(x);
}

DLL_PUBLIC double es6_cbrt(double x) {
    return cbrt(x);
}

DLL_PUBLIC int32_t es6_clz32(uint32_t x) {
#ifdef __GNUC__
    return __builtin_clz(x);
#elif defined _WIN32
    unsigned long where = 0;
    if (_BitScanForward(&where, value))
        return where;

    return 32;
#else
    static uint8_t const Table[] = {
        32, 31,  0, 16,  0, 30,  3, 0, 15,  0,  0,  0, 29, 10, 2,  0,
         0,  0, 12, 14, 21,  0, 19, 0,  0, 28,  0, 25,  0,  9, 1,  0,
        17,  0,  4,  0,  0,  0, 11, 0, 13, 22, 20,  0, 26,  0, 0, 18,
         5,  0,  0, 23,  0, 27,  0, 6,  0, 24,  7,  0,  8,  0, 0,  0
    };

    /* Propagate leftmost 1-bit to the right */
    x = x | (x >> 1);
    x = x | (x >> 2);
    x = x | (x >> 4);
    x = x | (x >> 8);
    x = x | (x >> 16);

    /* x = x * 0x6EB14F9 */
    x = (x << 3) - x;   /* Multiply by 7. */
    x = (x << 8) - x;   /* Multiply by 255. */
    x = (x << 8) - x;   /* Again. */
    x = (x << 8) - x;   /* Again. */

    return Table[(x >> 26)];
#endif
}

DLL_PUBLIC double es6_cosh(double x) {
    return cosh(x);
}

DLL_PUBLIC int32_t es6_imul(int32_t a, int32_t b) {
    return a * b;
}

DLL_PUBLIC float es6_fround(double x) {
    return (float)x;
}

DLL_PUBLIC double es6_sinh(double x) {
    return sinh(x);
}

DLL_PUBLIC double es6_tanh(double x) {
    return tanh(x);
}