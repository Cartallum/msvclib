dnl This provides configure definitions used by all the cygwin
dnl configure.in files.

AC_DEFUN([AC_CYGWIN_INCLUDES], [
: ${ac_cv_prog_CXX:=$CXX}
: ${ac_cv_prog_CC:=$CC}

cygwin_headers=$(realdirpath "$winsup_srcdir/cygwin/include")
if test -z "$cygwin_headers"; then
    AC_MSG_ERROR([cannot find $winsup_srcdir/cygwin/include directory])
fi

msvclib_headers=$(realdirpath $winsup_srcdir/../msvclib/libc/include)
if test -z "$msvclib_headers"; then
    AC_MSG_ERROR([cannot find msvclib source directory: $winsup_srcdir/../msvclib/libc/include])
fi
msvclib_headers="$target_builddir/msvclib/targ-include $msvclib_headers"

AM_CPPFLAGS="-I${winsup_srcdir}/cygwin -I${target_builddir}/winsup/cygwin"
AM_CPPFLAGS="${AM_CPPFLAGS} -isystem ${cygwin_headers}"
for h in ${msvclib_headers}; do
    AM_CPPFLAGS="${AM_CPPFLAGS} -isystem $h"
done
AC_SUBST(AM_CPPFLAGS)
])

AC_SUBST(target_builddir)
AC_SUBST(winsup_srcdir)
