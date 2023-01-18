dnl This is the msvclib/iconvdata configure.in file.
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([msvclib],[MSVCLIB_VERSION])
AC_CONFIG_SRCDIR([jis0201.c])

dnl Can't be done in MSVCLIB_CONFIGURE because that confuses automake. 
AC_CONFIG_AUX_DIR(../..)

MSVCLIB_CONFIGURE(..)

dnl We have to enable libtool after MSVCLIB_CONFIGURE because if we try and
dnl add it into MSVCLIB_CONFIGURE, executable tests are made before the first
dnl line of the macro which fail because appropriate LDFLAGS are not set.
_LT_DECL_SED
_LT_PROG_ECHO_BACKSLASH
if test "${use_libtool}" = "yes"; then
AC_LIBTOOL_WIN32_DLL
AM_PROG_LIBTOOL
fi

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
