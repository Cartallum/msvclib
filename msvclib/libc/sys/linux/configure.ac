dnl This is the msvclib/libc/sys/linux configure.in file.
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([msvclib],[MSVCLIB_VERSION])
AC_CONFIG_SRCDIR([linux.c])

dnl Can't be done in MSVCLIB_CONFIGURE because that confuses automake. 
AC_CONFIG_AUX_DIR(../../../..)

MSVCLIB_CONFIGURE(../../..)

dnl We have to enable libtool after MSVCLIB_CONFIGURE because if we try and
dnl add it into MSVCLIB_CONFIGURE, executable tests are made before the first
dnl line of the macro which fail because appropriate LDFLAGS are not set.
_LT_DECL_SED
_LT_PROG_ECHO_BACKSLASH
AC_PROG_AWK
if test "${use_libtool}" = "yes"; then
AC_LIBTOOL_WIN32_DLL
AM_PROG_LIBTOOL
fi

AC_CONFIG_SUBDIRS(machine)

if test "${msvclib_multithread}" = "yes"; then
AC_CONFIG_SUBDIRS(linuxthreads)
fi

LINUX_MACH_LIB=
if test -n "${machine_dir}"; then
  if test "${use_libtool}" = "yes"; then
    LINUX_MACH_LIB=machine/${machine_dir}/liblinux${machine_dir}.${aext}
  else
    LINUX_MACH_LIB=machine/lib.${aext}
  fi
fi
AC_SUBST(LINUX_MACH_LIB)

EXTRA_SUBDIRS=
EXTRA_SUBLIBS=

if test "x${msvclib_elix_level}" = "x1"; then
EXTRA_SUBDIRS=linuxthreads net
else 
EXTRA_SUBDIRS="linuxthreads net intl iconv dl"
EXTRA_SUBLIBS="net/libnet.la intl/libintl.la iconv/libiconv.la dl/libdl.la"
fi

AC_SUBST(EXTRA_SUBDIRS)
AC_SUBST(EXTRA_SUBLIBS)

AC_CONFIG_FILES([Makefile intl/Makefile net/Makefile iconv/Makefile dl/Makefile cmath/Makefile argp/Makefile])
AC_OUTPUT
