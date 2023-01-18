dnl This provides configure definitions used by all the msvclib
dnl configure.in files.

AC_DEFUN([DEF_MSVCLIB_MAJOR_VERSION],m4_define([MSVCLIB_MAJOR_VERSION],[4]))
AC_DEFUN([DEF_MSVCLIB_MINOR_VERSION],m4_define([MSVCLIB_MINOR_VERSION],[1]))
AC_DEFUN([DEF_MSVCLIB_PATCHLEVEL_VERSION],m4_define([MSVCLIB_PATCHLEVEL_VERSION],[0]))
AC_DEFUN([DEF_MSVCLIB_VERSION],m4_define([MSVCLIB_VERSION],[MSVCLIB_MAJOR_VERSION.MSVCLIB_MINOR_VERSION.MSVCLIB_PATCHLEVEL_VERSION]))

dnl Basic msvclib configury.  This calls basic introductory stuff,
dnl including AM_INIT_AUTOMAKE and AC_CANONICAL_HOST.  It also runs
dnl configure.host.  The only argument is the relative path to the top
dnl msvclib directory.

AC_DEFUN([MSVCLIB_CONFIGURE],
[AC_REQUIRE([DEF_MSVCLIB_VERSION])
dnl Default to --enable-multilib
AC_ARG_ENABLE(multilib,
[  --enable-multilib         build many library versions (default)],
[case "${enableval}" in
  yes) multilib=yes ;;
  no)  multilib=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for multilib option) ;;
 esac], [multilib=yes])dnl

dnl Support --enable-target-optspace
AC_ARG_ENABLE(target-optspace,
[  --enable-target-optspace  optimize for space],
[case "${enableval}" in
  yes) target_optspace=yes ;;
  no)  target_optspace=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for target-optspace option) ;;
 esac], [target_optspace=])dnl

dnl Support --enable-malloc-debugging - currently only supported for Cygwin
AC_ARG_ENABLE(malloc-debugging,
[  --enable-malloc-debugging indicate malloc debugging requested],
[case "${enableval}" in
  yes) malloc_debugging=yes ;;
  no)  malloc_debugging=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for malloc-debugging option) ;;
 esac], [malloc_debugging=])dnl

dnl Support --enable-msvclib-multithread
AC_ARG_ENABLE(msvclib-multithread,
[  --enable-msvclib-multithread        enable support for multiple threads],
[case "${enableval}" in
  yes) msvclib_multithread=yes ;;
  no)  msvclib_multithread=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-multithread option) ;;
 esac], [msvclib_multithread=yes])dnl

dnl Support --enable-msvclib-iconv
AC_ARG_ENABLE(msvclib-iconv,
[  --enable-msvclib-iconv     enable iconv library support],
[if test "${msvclib_iconv+set}" != set; then
   case "${enableval}" in
     yes) msvclib_iconv=yes ;;
     no)  msvclib_iconv=no ;;
     *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-iconv option) ;;
   esac
 fi], [msvclib_iconv=${msvclib_iconv}])dnl

dnl Support --enable-msvclib-elix-level
AC_ARG_ENABLE(msvclib-elix-level,
[  --enable-msvclib-elix-level         supply desired elix library level (1-4)],
[case "${enableval}" in
  0)   msvclib_elix_level=0 ;;
  1)   msvclib_elix_level=1 ;;
  2)   msvclib_elix_level=2 ;;
  3)   msvclib_elix_level=3 ;;
  4)   msvclib_elix_level=4 ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-elix-level option) ;;
 esac], [msvclib_elix_level=0])dnl

dnl Support --disable-msvclib-io-float
AC_ARG_ENABLE(msvclib-io-float,
[  --disable-msvclib-io-float disable printf/scanf family float support],
[case "${enableval}" in
  yes) msvclib_io_float=yes ;;
  no)  msvclib_io_float=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-io-float option) ;;
 esac], [msvclib_io_float=yes])dnl

dnl Support --disable-msvclib-supplied-syscalls
AC_ARG_ENABLE(msvclib-supplied-syscalls,
[  --disable-msvclib-supplied-syscalls disable msvclib from supplying syscalls],
[case "${enableval}" in
  yes) msvclib_may_supply_syscalls=yes ;;
  no)  msvclib_may_supply_syscalls=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-supplied-syscalls option) ;;
 esac], [msvclib_may_supply_syscalls=yes])dnl

AM_CONDITIONAL(MAY_SUPPLY_SYSCALLS, test x[$]{msvclib_may_supply_syscalls} = xyes)

dnl Support --disable-msvclib-fno-builtin
AC_ARG_ENABLE(msvclib-fno-builtin,
[  --disable-msvclib-fno-builtin disable -fno-builtin flag to allow compiler to use builtin library functions],
[case "${enableval}" in
  yes) msvclib_fno_builtin=yes ;;
  no)  msvclib_fno_builtin=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-fno-builtin option) ;;
 esac], [msvclib_fno_builtin=])dnl


dnl We may get other options which we don't document:
dnl --with-target-subdir, --with-multisrctop, --with-multisubdir

test -z "[$]{with_target_subdir}" && with_target_subdir=.

if test "[$]{srcdir}" = "."; then
  if test "[$]{with_target_subdir}" != "."; then
    msvclib_basedir="[$]{srcdir}/[$]{with_multisrctop}../$1"
  else
    msvclib_basedir="[$]{srcdir}/[$]{with_multisrctop}$1"
  fi
else
  msvclib_basedir="[$]{srcdir}/$1"
fi
AC_SUBST(msvclib_basedir)

AC_CANONICAL_HOST

AM_INIT_AUTOMAKE([cygnus no-define 1.9.5])

# FIXME: We temporarily define our own version of AC_PROG_CC.  This is
# copied from autoconf 2.12, but does not call AC_PROG_CC_WORKS.  We
# are probably using a cross compiler, which will not be able to fully
# link an executable.  This should really be fixed in autoconf
# itself.

AC_DEFUN([LIB_AC_PROG_CC_GNU],
[AC_CACHE_CHECK(whether we are using GNU C, ac_cv_prog_gcc,
[dnl The semicolon is to pacify NeXT's syntax-checking cpp.
cat > conftest.c <<EOF
#ifdef __GNUC__
  yes;
#endif
EOF
if AC_TRY_COMMAND(${CC-cc} -E conftest.c) | egrep yes >/dev/null 2>&1; then
  ac_cv_prog_gcc=yes
else
  ac_cv_prog_gcc=no
fi])])

AC_DEFUN([LIB_AM_PROG_AS],
[# By default we simply use the C compiler to build assembly code.
AC_REQUIRE([LIB_AC_PROG_CC])
test "${CCAS+set}" = set || CCAS=$CC
test "${CCASFLAGS+set}" = set || CCASFLAGS=$CFLAGS
AC_ARG_VAR([CCAS],      [assembler compiler command (defaults to CC)])
AC_ARG_VAR([CCASFLAGS], [assembler compiler flags (defaults to CFLAGS)])
])

AC_DEFUN([LIB_AC_PROG_CC],
[AC_BEFORE([$0], [AC_PROG_CPP])dnl
AC_CHECK_PROG(CC, gcc, gcc)
_AM_DEPENDENCIES(CC)
if test -z "$CC"; then
  AC_CHECK_PROG(CC, cc, cc, , , /usr/ucb/cc)
  test -z "$CC" && AC_MSG_ERROR([no acceptable cc found in \$PATH])
fi

LIB_AC_PROG_CC_GNU

if test $ac_cv_prog_gcc = yes; then
  GCC=yes
dnl Check whether -g works, even if CFLAGS is set, in case the package
dnl plays around with CFLAGS (such as to build both debugging and
dnl normal versions of a library), tasteless as that idea is.
  ac_test_CFLAGS="${CFLAGS+set}"
  ac_save_CFLAGS="$CFLAGS"
  _AC_PROG_CC_G
  if test "$ac_test_CFLAGS" = set; then
    CFLAGS="$ac_save_CFLAGS"
  elif test $ac_cv_prog_cc_g = yes; then
    CFLAGS="-g -O2"
  else
    CFLAGS="-O2"
  fi
else
  GCC=
  test "${CFLAGS+set}" = set || CFLAGS="-g"
fi
])

LIB_AC_PROG_CC

AC_CHECK_TOOL(AS, as)
AC_CHECK_TOOL(AR, ar)
AC_CHECK_TOOL(RANLIB, ranlib, :)
AC_CHECK_TOOL(READELF, readelf, :)

AC_PROG_INSTALL

# Hack to ensure that INSTALL won't be set to "../" with autoconf 2.13.  */
ac_given_INSTALL=$INSTALL

AM_MAINTAINER_MODE
LIB_AM_PROG_AS

# We need AC_EXEEXT to keep automake happy in cygnus mode.  However,
# at least currently, we never actually build a program, so we never
# need to use $(EXEEXT).  Moreover, the test for EXEEXT normally
# fails, because we are probably configuring with a cross compiler
# which can't create executables.  So we include AC_EXEEXT to keep
# automake happy, but we don't execute it, since we don't care about
# the result.
if false; then
  AC_EXEEXT
  dummy_var=1
fi

. [$]{msvclib_basedir}/configure.host

MSVCLIB_CFLAGS=${msvclib_cflags}
AC_SUBST(MSVCLIB_CFLAGS)

NO_INCLUDE_LIST=${noinclude}
AC_SUBST(NO_INCLUDE_LIST)

LDFLAGS=${ldflags}
AC_SUBST(LDFLAGS)

AM_CONDITIONAL(ELIX_LEVEL_0, test x[$]{msvclib_elix_level} = x0)
AM_CONDITIONAL(ELIX_LEVEL_1, test x[$]{msvclib_elix_level} = x1)
AM_CONDITIONAL(ELIX_LEVEL_2, test x[$]{msvclib_elix_level} = x2)
AM_CONDITIONAL(ELIX_LEVEL_3, test x[$]{msvclib_elix_level} = x3)
AM_CONDITIONAL(ELIX_LEVEL_4, test x[$]{msvclib_elix_level} = x4)

AM_CONDITIONAL(USE_LIBTOOL, test x[$]{use_libtool} = xyes)

# Emit any target-specific warnings.
if test "x${msvclib_msg_warn}" != "x"; then
   AC_MSG_WARN([${msvclib_msg_warn}])
fi

# Hard-code OBJEXT.  Normally it is set by AC_OBJEXT, but we
# use oext, which is set in configure.host based on the target platform.
OBJEXT=${oext}

AC_SUBST(OBJEXT)
AC_SUBST(oext)
AC_SUBST(aext)
AC_SUBST(lpfx)

AC_SUBST(libm_machine_dir)
AC_SUBST(machine_dir)
AC_SUBST(shared_machine_dir)
AC_SUBST(sys_dir)
])
