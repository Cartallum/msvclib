dnl This is the msvclib/libc/machine/spu configure.in file.
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([msvclib],[MSVCLIB_VERSION])
AC_CONFIG_SRCDIR([Makefile.am])

dnl Can't be done in MSVCLIB_CONFIGURE because that confuses automake. 
AC_CONFIG_AUX_DIR(../../../..)

MSVCLIB_CONFIGURE(../../..)

AC_MSG_CHECKING([whether the compiler supports __ea])
dnl We do not use AC_COMPILE_IFELSE to support building msvclib with
dnl a cross-compiler that is not (yet) able to link executables
cat > conftest.c <<EOF
#if defined (__EA32__) || defined (__EA64__)
  yes;
#endif
EOF
if AC_TRY_COMMAND(${CC-cc} -E conftest.c) | egrep yes >/dev/null 2>&1; then
  spu_compiler_has_ea=yes
else
  spu_compiler_has_ea=no
fi
AM_CONDITIONAL(HAVE_SPU_EA, test x${spu_compiler_has_ea} != xno)
AC_MSG_RESULT($spu_compiler_has_ea)

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
