dnl This is the msvclib/libc/machine/i386 configure.in file.
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([msvclib],[MSVCLIB_VERSION])
AC_CONFIG_SRCDIR([f_math.h])

dnl Can't be done in MSVCLIB_CONFIGURE because that confuses automake. 
AC_CONFIG_AUX_DIR(../../../..)

MSVCLIB_CONFIGURE(../../..)

dnl We have to add the following lines because automake detects the
dnl references to libtool libraries from aclocal and tries to verify that
dnl AM_PROG_LIBTOOL is being used.  This code must occur after
dnl MSVCLIB_CONFIGURE. 
_LT_DECL_SED
_LT_PROG_ECHO_BACKSLASH
if test "${use_libtool}" = "yes"; then
AC_LIBTOOL_WIN32_DLL
AM_PROG_LIBTOOL
fi

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
