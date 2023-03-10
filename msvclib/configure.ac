dnl This is the msvclib configure.in file.
dnl Process this file with autoconf to produce a configure script.

AC_PREREQ(2.59)
AC_INIT([msvclib],[MSVCLIB_VERSION])
AC_CONFIG_SRCDIR([libc])
AC_CONFIG_HEADERS([_msvclib_version.h:_msvclib_version.hin msvclib.h:msvclib.hin])

dnl Can't be done in MSVCLIB_CONFIGURE because that confuses automake. 
AC_CONFIG_AUX_DIR(..)

dnl Support --enable-msvclib-io-pos-args
dnl This option is actually read in libc/configure.in.  It is repeated
dnl here so that it shows up in the help text.
AC_ARG_ENABLE(msvclib-io-pos-args,
[  --enable-msvclib-io-pos-args enable printf-family positional arg support],
[case "${enableval}" in
  yes) msvclib_io_pos_args=yes ;;
  no)  msvclib_io_pos_args=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-io-pos-args option) ;;
 esac], [msvclib_io_pos_args=])dnl

dnl Support --enable-msvclib-io-c99-formats
AC_ARG_ENABLE(msvclib-io-c99-formats,
[  --enable-msvclib-io-c99-formats   enable C99 support in IO functions like printf/scanf],
[case "${enableval}" in
  yes) msvclib_io_c99_formats=yes;;
  no)  msvclib_io_c99_formats=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-io-c99-formats option) ;;
 esac], [msvclib_io_c99_formats=])dnl

dnl Support --enable-msvclib-register-fini
AC_ARG_ENABLE(msvclib-register-fini,
[  --enable-msvclib-register-fini   enable finalization function registration using atexit],
[case "${enableval}" in
  yes) msvclib_register_fini=yes;;
  no)  msvclib_register_fini=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-register-fini option) ;;
 esac], [msvclib_register_fini=])dnl

dnl Support --enable-msvclib-io-long-long
AC_ARG_ENABLE(msvclib-io-long-long,
[  --enable-msvclib-io-long-long   enable long long type support in IO functions like printf/scanf],
[case "${enableval}" in
  yes) msvclib_io_long_long=yes;;
  no)  msvclib_io_long_long=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-io-long-long option) ;;
 esac], [msvclib_io_long_long=])dnl

dnl Support --enable-msvclib-io-long-double
AC_ARG_ENABLE(msvclib-io-long-double,
[  --enable-msvclib-io-long-double   enable long double type support in IO functions printf/scanf],
[case "${enableval}" in
  yes) msvclib_io_long_double=yes;;
  no)  msvclib_io_long_double=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-io-long-double option) ;;
 esac], [msvclib_io_long_double=])dnl

dnl If multibyte support is enabled, iconv should be enabled too
dnl Support --enable-msvclib-mb
AC_ARG_ENABLE(msvclib-mb,
[  --enable-msvclib-mb        enable multibyte support],
[case "${enableval}" in
  yes) msvclib_mb=yes;;
  no)  msvclib_mb=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-mb option) ;;
 esac], [msvclib_mb=])dnl

dnl Enable verification of successful memory allocation for _REENT_CHECK family of macros
dnl Support --disable-msvclib-reent-check-verify
AC_ARG_ENABLE(msvclib-reent-check-verify,
[  --disable-msvclib-reent-check-verify        disable checking of _REENT_CHECK memory allocation],
[case "${enableval}" in
  yes) msvclib_reent_check_verify=yes;;
  no)  msvclib_reent_check_verify=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-reent-check-verify option) ;;
 esac], [msvclib_reent_check_verify=])dnl

dnl Support --enable-msvclib-iconv-encodings
AC_ARG_ENABLE(msvclib-iconv-encodings,
[  --enable-msvclib-iconv-encodings   enable specific comma-separated list of bidirectional iconv encodings to be built-in],
[if test x${enableval} = x; then
   AC_MSG_ERROR(bad value ${enableval} for msvclib-iconv-encodings option - use comma-separated encodings list)
 fi
 iconv_encodings=${enableval}
 ], [iconv_encodings=])dnl

dnl Support --enable-msvclib-iconv-from-encodings
AC_ARG_ENABLE(msvclib-iconv-from-encodings,
[  --enable-msvclib-iconv-from-encodings   enable specific comma-separated list of \"from\" iconv encodings to be built-in],
[if test x${enableval} = x; then
   AC_MSG_ERROR(bad value ${enableval} for msvclib-iconv-from-encodings option - use comma-separated encodings list)
 fi
 iconv_from_encodings=${enableval}
 ], [iconv_from_encodings=])dnl

dnl Support --enable-msvclib-iconv-to-encodings
AC_ARG_ENABLE(msvclib-iconv-to-encodings,
[  --enable-msvclib-iconv-to-encodings   enable specific comma-separated list of \"to\" iconv encodings to be built-in],
[if test x${enableval} = x; then
   AC_MSG_ERROR(bad value ${enableval} for msvclib-iconv-to-encodings option - use comma-separated encodings list)
 fi
 iconv_to_encodings=${enableval}
 ], [iconv_to_encodings=])dnl

dnl Support --enable-msvclib-iconv-external-ccs
AC_ARG_ENABLE(msvclib-iconv-external-ccs,
[  --enable-msvclib-iconv-external-ccs     enable capabilities to load external CCS files for iconv],
[if test "${msvclib_iconv_external_ccs+set}" != set; then
   case "${enableval}" in
     yes) msvclib_iconv_external_ccs=yes ;;
     no)  msvclib_iconv_external_ccs=no ;;
     *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-iconv-external-ccs option) ;;
   esac
 fi], [msvclib_iconv_external_ccs=${msvclib_iconv_external_ccs}])dnl

dnl Support --disable-msvclib-atexit-dynamic-alloc
AC_ARG_ENABLE(msvclib-atexit-dynamic-alloc,
[  --disable-msvclib-atexit-dynamic-alloc    disable dynamic allocation of atexit entries],
[if test "${msvclib_atexit_dynamic_alloc+set}" != set; then
  case "${enableval}" in
    yes) msvclib_atexit_dynamic_alloc=yes ;;
    no)  msvclib_atexit_dynamic_alloc=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-atexit-dynamic-alloc option) ;;
  esac
 fi], [msvclib_atexit_dynamic_alloc=${msvclib_atexit_dynamic_alloc}])dnl

dnl Support --enable-msvclib-global-atexit
dnl Enable atexit data structure as global variables to save memory usage in
dnl _reent.
AC_ARG_ENABLE(msvclib-global-atexit,
[  --enable-msvclib-global-atexit	enable atexit data structure as global],
[if test "${msvclib_global_atexit+set}" != set; then
  case "${enableval}" in
    yes) msvclib_global_atexit=yes ;;
    no)  msvclib_global_atexit=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-global-atexit option) ;;
  esac
 fi], [msvclib_global_atexit=no])dnl

dnl Support --enable-msvclib-reent-small
AC_ARG_ENABLE(msvclib-reent-small,
[  --enable-msvclib-reent-small   enable small reentrant struct support],
[case "${enableval}" in
  yes) msvclib_reent_small=yes;;
  no)  msvclib_reent_small=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-reent-small option) ;;
 esac], [msvclib_reent_small=])dnl

dnl Support --enable-msvclib-global-stdio-streams
AC_ARG_ENABLE(msvclib-global-stdio-streams,
[  --enable-msvclib-global-stdio-streams   enable global stdio streams],
[case "${enableval}" in
  yes) msvclib_global_stdio_streams=yes;;
  no)  msvclib_global_stdio_streams=no ;;
  *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-global-stdio-streams option) ;;
 esac], [msvclib_global_stdio_streams=])dnl
 
dnl Support --disable-msvclib-fvwrite-in-streamio
AC_ARG_ENABLE(msvclib-fvwrite-in-streamio,
[  --disable-msvclib-fvwrite-in-streamio    disable iov in streamio],
[if test "${msvclib_fvwrite_in_streamio+set}" != set; then
  case "${enableval}" in
    yes) msvclib_fvwrite_in_streamio=yes ;;
    no)  msvclib_fvwrite_in_streamio=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-fvwrite-in-streamio option) ;;
  esac
 fi], [msvclib_fvwrite_in_streamio=yes])dnl

dnl Support --disable-msvclib-fseek-optimization
AC_ARG_ENABLE(msvclib-fseek-optimization,
[  --disable-msvclib-fseek-optimization    disable fseek optimization],
[if test "${msvclib_fseek_optimization+set}" != set; then
  case "${enableval}" in
    yes) msvclib_fseek_optimization=yes ;;
    no)  msvclib_fseek_optimization=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-fseek-optimization option) ;;
  esac
 fi], [msvclib_fseek_optimization=yes])dnl
 
dnl Support --enable-msvclib-wide-orient
dnl This option is also read in libc/configure.in.  It is repeated
dnl here so that it shows up in the help text.
AC_ARG_ENABLE(msvclib_wide_orient,
[  --disable-msvclib-wide-orient    Turn off wide orientation in streamio],
[case "${enableval}" in
   yes) msvclib_wide_orient=yes ;;
   no)  msvclib_wide_orient=no ;;
   *) AC_MSG_ERROR(bad value ${enableval} for msvclib-wide-orient) ;;
 esac],[msvclib_wide_orient=yes])

dnl Support --enable-msvclib-nano-malloc
dnl This option is also read in libc/configure.in.  It is repeated
dnl here so that it shows up in the help text.
AC_ARG_ENABLE(msvclib-nano-malloc,
[  --enable-msvclib-nano-malloc    use small-footprint nano-malloc implementation],
[if test "${msvclib_nano_malloc+set}" != set; then
  case "${enableval}" in
    yes) msvclib_nano_malloc=yes ;;
    no)  msvclib_nano_malloc=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-nano-malloc option) ;;
  esac
 fi], [msvclib_nano_malloc=])dnl

dnl Support --disable-msvclib-unbuf-stream-opt
AC_ARG_ENABLE(msvclib-unbuf-stream-opt,
[  --disable-msvclib-unbuf-stream-opt    disable unbuffered stream optimization in streamio],
[if test "${msvclib_unbuf_stream_opt+set}" != set; then
  case "${enableval}" in
    yes) msvclib_unbuf_stream_opt=yes ;;
    no)  msvclib_unbuf_stream_opt=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-unbuf-stream-opt option) ;;
  esac
 fi], [msvclib_unbuf_stream_opt=yes])dnl

dnl Support --enable-lite-exit
dnl Lite exit is a size-reduced implementation of exit that doesn't invoke
dnl clean-up functions such as _fini or global destructors.
AC_ARG_ENABLE(lite-exit,
[  --enable-lite-exit	enable light weight exit],
[if test "${lite_exit+set}" != set; then
  case "${enableval}" in
    yes) lite_exit=yes ;;
    no)  lite_exit=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for lite-exit option) ;;
  esac
 fi], [lite_exit=no])dnl

dnl Support --enable-msvclib-nano-formatted-io
dnl This option is also read in libc/configure.in.  It is repeated
dnl here so that it shows up in the help text.
AC_ARG_ENABLE(msvclib_nano_formatted_io,
[  --enable-msvclib-nano-formatted-io    Use nano version formatted IO],
[case "${enableval}" in
   yes) msvclib_nano_formatted_io=yes ;;
   no)  msvclib_nano_formatted_io=no ;;
   *) AC_MSG_ERROR(bad value ${enableval} for msvclib-nano-formatted-io) ;;
 esac],[msvclib_nano_formatted_io=no])

dnl Support --enable-retargetable-locking
dnl This option is also read in libc/configure.in.  It is repeated
dnl here so that it shows up in the help text.
AC_ARG_ENABLE(msvclib-retargetable-locking,
[  --enable-msvclib-retargetable-locking    Allow locking routines to be retargeted at link time],
[case "${enableval}" in
   yes) msvclib_retargetable_locking=yes ;;
   no)  msvclib_retargetable_locking=no ;;
   *) AC_MSG_ERROR(bad value ${enableval} for msvclib-retargetable-locking) ;;
 esac],[msvclib_retargetable_locking=no])

dnl Support --enable-msvclib-long-time_t
AC_ARG_ENABLE(msvclib-long-time_t,
[  --enable-msvclib-long-time_t   define time_t to long],
[if test "${msvclib_long_time_t+set}" != set; then
  case "${enableval}" in
    yes) msvclib_long_time_t=yes ;;
    no)  msvclib_long_time_t=no  ;;
    *)   AC_MSG_ERROR(bad value ${enableval} for msvclib-long-time_t option) ;;
  esac
 fi], [msvclib_long_time_t=no])dnl

MSVCLIB_CONFIGURE(.)

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

dnl The following is being disabled because the mathfp library is
dnl not up to standard due to inaccuracies caused by some of the
dnl floating-point algorithms used.  If you wish to work on this,
dnl comment out the following line and uncomment out the lines
dnl following it to re-enable the feature.
msvclib_hw_fp=false
#AC_ARG_ENABLE(msvclib_hw_fp,
#[  --enable-msvclib-hw-fp    Turn on hardware floating point math],
#[case "${enableval}" in
#   yes) msvclib_hw_fp=true ;;
#   no)  msvclib_hw_fp=false ;;
#   *) AC_MSG_ERROR(bad value ${enableval} for --enable-msvclib-hw-fp) ;;
# esac],[msvclib_hw_fp=false])
AM_CONDITIONAL(MSVCLIB_HW_FP, test x$msvclib_hw_fp = xtrue)

# These get added in the top-level configure.in, except in the case where
# msvclib is being built natively.
LIBC_INCLUDE_GREP=`echo ${CC} | grep \/libc\/include`
abs_msvclib_basedir=`cd ${msvclib_basedir} && pwd`
if test -z "${LIBC_INCLUDE_GREP}"; then
  CC_FOR_MSVCLIB="${CC} -I$PWD/targ-include -I${abs_msvclib_basedir}/libc/include"
else
  CC_FOR_MSVCLIB="${CC}"
fi
AC_SUBST(CC_FOR_MSVCLIB)

AC_CONFIG_SUBDIRS(libc)
AC_CONFIG_SUBDIRS(libm)

if test -z "${with_multisubdir}"; then
  have_multisubdir=no
  AC_CONFIG_SUBDIRS(doc)
else
  have_multisubdir=yes
fi
AM_CONDITIONAL(HAVE_DOC, test x$have_multisubdir = xno)

# Some run-time support libraries provided by GCC (e.g. libgomp) use configure
# checks to detect certain features, e.g. availability of thread-local storage.
# The configure script generates a test program and tries to compile and link
# it.  It should use target libraries and startfiles of the build tree if
# available and not random ones from the installation prefix for this
# procedure.  The search directories specified by -B are a bit special, see
# for_each_path() in gcc.c of the GCC sources.  First a search is performed on
# all search paths with the multilib directory appended (if desired), then a
# second search is performed on demand with the base directory only.  For each
# multilib there is a "msvclib" subdirectory.  This directory is specified by a
# -B option for the support libraries.  In order to find the msvclib artifacts
# (ctr0.o, libc.a, libg.a and libm.a) they must be located in a proper multilib
# subdirectory withing the build directory.
AM_CONDITIONAL(HAVE_MULTISUBDIR, test x$have_multisubdir = xyes)

EXTRA_DIRS=
case $host in
  i[[34567]]86-pc-linux-*)
  	AC_CONFIG_SUBDIRS(iconvdata)
	EXTRA_DIRS=iconvdata
	;;
esac
AC_SUBST(EXTRA_DIRS)

CRT0=
CRT0_DIR=
if test "x${have_crt0}" = "xyes"; then
  CRT0=crt0.o
  CRT0_DIR=libc/
fi
AM_CONDITIONAL(HAVE_CRT0, test x$have_crt0 = xyes)
AC_SUBST(CRT0)
AC_SUBST(CRT0_DIR)

CRT1=${crt1}
CRT1_DIR=
if test -n "${crt1_dir}"; then
  CRT1_DIR=${crt1_dir}/
fi
AC_SUBST(CRT1)
AC_SUBST(CRT1_DIR)

if test -n "${libm_machine_dir}"; then
  LIBM_MACHINE_OBJECTLIST=libm/machine/${libm_machine_dir}/objectlist.awk.in
fi
AC_SUBST(LIBM_MACHINE_OBJECTLIST)

if test -n "${machine_dir}"; then
  MACHINE_OBJECTLIST=libc/machine/${machine_dir}/objectlist.awk.in
fi
AC_SUBST(MACHINE_OBJECTLIST)

if test -n "${sys_dir}"; then
  SYS_OBJECTLIST=libc/sys/${sys_dir}/objectlist.awk.in
fi
AC_SUBST(SYS_OBJECTLIST)

if test "${have_sys_mach_dir}" = "yes"; then
  SYS_MACH_OBJECTLIST=libc/sys/${sys_dir}/machine/${machine_dir}/objectlist.awk.in
fi
AC_SUBST(SYS_MACH_OBJECTLIST)

if test -n "${posix_dir}"; then
  POSIX_OBJECTLIST=libc/${posix_dir}/objectlist.awk.in
fi
AC_SUBST(POSIX_OBJECTLIST)

if test -n "${signal_dir}"; then
  SIGNAL_OBJECTLIST=libc/${signal_dir}/objectlist.awk.in
fi
AC_SUBST(SIGNAL_OBJECTLIST)

if test -n "${syscall_dir}"; then
  SYSCALL_OBJECTLIST=libc/${syscall_dir}/objectlist.awk.in
fi
AC_SUBST(SYSCALL_OBJECTLIST)

if test -n "${unix_dir}"; then
  UNIX_OBJECTLIST=libc/${unix_dir}/objectlist.awk.in
fi
AC_SUBST(UNIX_OBJECTLIST)

if test -n "${stdio64_dir}"; then
  STDIO64_OBJECTLIST=libc/${stdio64_dir}/objectlist.awk.in
fi
AC_SUBST(STDIO64_OBJECTLIST)

# Put a plausible default for CC_FOR_BUILD in Makefile.
if test -z "$CC_FOR_BUILD"; then
  CC_FOR_BUILD=gcc
fi
AC_SUBST(CC_FOR_BUILD)

if test "${msvclib_elix_level}" -gt "0"; then
AC_DEFINE_UNQUOTED(_ELIX_LEVEL,${msvclib_elix_level})
fi

if test "${msvclib_reent_check_verify}" = "yes"; then
AC_DEFINE_UNQUOTED(_REENT_CHECK_VERIFY)
fi

if test "${msvclib_io_c99_formats}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_IO_C99_FORMATS)
fi

if test "${msvclib_register_fini}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_REGISTER_FINI)
fi

if test "${msvclib_io_long_long}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_IO_LONG_LONG)
fi

if test "${msvclib_io_long_double}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_IO_LONG_DOUBLE)
fi

if test "${msvclib_io_pos_args}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_IO_POS_ARGS)
fi

if test "${msvclib_reent_small}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_REENT_SMALL)
fi

if test "${msvclib_global_stdio_streams}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_REENT_GLOBAL_STDIO_STREAMS)
fi

if test "${msvclib_mb}" = "yes"; then
AC_DEFINE_UNQUOTED(_MB_CAPABLE)
AC_DEFINE_UNQUOTED(_MB_LEN_MAX,8)
else
AC_DEFINE_UNQUOTED(_MB_LEN_MAX,1)
fi

if test "${msvclib_iconv_external_ccs}" = "yes"; then
AC_DEFINE_UNQUOTED(_ICONV_ENABLE_EXTERNAL_CCS)
fi

AC_DEFINE(_MSVCLIB_VERSION,"MSVCLIB_VERSION","The msvclib version in string format.")
AC_DEFINE(__MSVCLIB__,MSVCLIB_MAJOR_VERSION,"The msvclib major version number.")
AC_DEFINE(__MSVCLIB_MINOR__,MSVCLIB_MINOR_VERSION,"The msvclib minor version number.")
AC_DEFINE(__MSVCLIB_PATCHLEVEL__,MSVCLIB_PATCHLEVEL_VERSION,"The msvclib patch level.")

if test "${multilib}" = "yes"; then
  multilib_arg="--enable-multilib"
else
  multilib_arg=
fi

if test "${msvclib_iconv}" = "yes"; then
AC_DEFINE_UNQUOTED(_ICONV_ENABLED,1)
fi

if test "x${msvclib_iconv_external_ccs}" = "xyes"; then
  if test "x${msvclib_iconv}" = "x"; then
      AC_MSG_ERROR(--enable-msvclib-iconv-external-ccs option can't be used if iconv library is disabled, use --enable-msvclib-iconv to enable it.)
  fi
  AC_DEFINE_UNQUOTED(_ICONV_ENABLE_EXTERNAL_CCS,1)
fi

if test "${msvclib_atexit_dynamic_alloc}" = "yes"; then
AC_DEFINE_UNQUOTED(_ATEXIT_DYNAMIC_ALLOC)
fi

if test "${msvclib_global_atexit}" = "yes"; then
AC_DEFINE_UNQUOTED(_REENT_GLOBAL_ATEXIT)
fi

if test "${msvclib_fvwrite_in_streamio}" = "yes"; then
AC_DEFINE_UNQUOTED(_FVWRITE_IN_STREAMIO)
fi

if test "${msvclib_fseek_optimization}" = "yes"; then
AC_DEFINE_UNQUOTED(_FSEEK_OPTIMIZATION)
fi

if test "${msvclib_wide_orient}" = "yes"; then
AC_DEFINE_UNQUOTED(_WIDE_ORIENT)
fi

if test "${msvclib_nano_malloc}" = "yes"; then
AC_DEFINE_UNQUOTED(_NANO_MALLOC)
fi

if test "${msvclib_unbuf_stream_opt}" = "yes"; then
AC_DEFINE_UNQUOTED(_UNBUF_STREAM_OPT)
fi

if test "${lite_exit}" = "yes"; then
AC_DEFINE_UNQUOTED(_LITE_EXIT)
fi

if test "${msvclib_nano_formatted_io}" = "yes"; then
AC_DEFINE_UNQUOTED(_NANO_FORMATTED_IO)
fi

if test "${msvclib_retargetable_locking}" = "yes"; then
AC_DEFINE_UNQUOTED(_RETARGETABLE_LOCKING)
fi

if test "${msvclib_long_time_t}" = "yes"; then
AC_DEFINE_UNQUOTED(_WANT_USE_LONG_TIME_T)
fi

dnl
dnl Parse --enable-msvclib-iconv-encodings option argument
dnl

if test "x${iconv_encodings}" != "x" \
   || test "x${iconv_to_encodings}" != "x" \
   || test "x${iconv_from_encodings}" != "x"; then
  if test "x${msvclib_iconv}" = "x"; then
      AC_MSG_ERROR([--enable-msvclib-iconv-encodings, --enable-msvclib-iconv-from-encodings and --enable-msvclib-iconv-to-encodings option can't be used if iconv library is disabled, use --enable-msvclib-iconv to enable it.])
  fi
  
  dnl Normalize encodings names and delete commas
  iconv_encodings=`echo "${iconv_encodings}" | sed -e 's/,/ /g' -e 's/-/_/g' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
  iconv_to_encodings=`echo "${iconv_to_encodings}" | sed -e 's/,/ /g' -e 's/-/_/g' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
  iconv_from_encodings=`echo "${iconv_from_encodings}" | sed -e 's/,/ /g' -e 's/-/_/g' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
 
  dnl Get the list of available encodings excluding comments
  dnl Join line with previous if the first character is whitespace
  available_encodings=`cat "${srcdir}/libc/iconv/encoding.aliases" | sed -e '/^#.*/d'`
  
  dnl Check if required encodings are supported
  dnl Convert aliases to names
  
  dnl iconv_encodings
  iconv_encodings1="${iconv_encodings}"
  iconv_encodings=""
  for encoding in ${iconv_encodings1}; do
      result=`echo "${available_encodings}" | grep -e "\(^\| \)${encoding}\( \|\$\)"`
      if test $? != "0"; then
	  AC_MSG_ERROR(${encoding} is not supported - see ${srcdir}/libc/iconv/encoding.aliases file for the list of available encodings)
      fi
      encoding1=`echo "${result}" | sed -e 's/\(^[[^ ]]*\).*$/\1/'`
      iconv_encodings="${iconv_encodings} ${encoding1}"
  done
  dnl Enable appropriate option in msvclib.h
  for encoding in ${iconv_encodings}; do
      opt=_ICONV_TO_ENCODING_`echo "${encoding}" | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
      AC_DEFINE_UNQUOTED($opt,1)
      opt=_ICONV_FROM_ENCODING_`echo "${encoding}" | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
      AC_DEFINE_UNQUOTED($opt,1)
  done

  dnl iconv_to_encodings
  iconv_encodings1="${iconv_to_encodings}"
  iconv_to_encodings=""
  for encoding in ${iconv_encodings1}; do
      result=`echo "${available_encodings}" | grep -e "\(^\| \)${encoding}\( \|\$\)"`
      if test $? != "0"; then
	  AC_MSG_ERROR(${encoding} is not supported - see ${srcdir}/libc/iconv/encoding.aliases file for the list of available encodings)
      fi
      encoding1=`echo "${result}" | sed -e 's/\(^[[^ ]]*\).*$/\1/'`
      iconv_to_encodings="${iconv_to_encodings} ${encoding1}"
  done
  dnl Enable appropriate option in msvclib.h
  for encoding in ${iconv_to_encodings}; do
      opt=_ICONV_TO_ENCODING_`echo "${encoding}" | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
      AC_DEFINE_UNQUOTED($opt,1)
  done

  dnl iconv_from_encodings
  iconv_encodings1="${iconv_from_encodings}"
  iconv_from_encodings=""
  for encoding in ${iconv_encodings1}; do
      result=`echo "${available_encodings}" | grep -e "\(^\| \)${encoding}\( \|\$\)"`
      if test $? != "0"; then
	  AC_MSG_ERROR(${encoding} is not supported - see ${srcdir}/libc/iconv/encoding.aliases file for the list of available encodings)
      fi
      encoding1=`echo "${result}" | sed -e 's/\(^[[^ ]]*\).*$/\1/'`
      iconv_from_encodings="${iconv_from_encodings} ${encoding1}"
  done
  dnl Enable appropriate option in msvclib.h
  for encoding in ${iconv_from_encodings}; do
      opt=_ICONV_FROM_ENCODING_`echo "${encoding}" | sed -e 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/'`
      AC_DEFINE_UNQUOTED($opt,1)
  done
fi;

AC_CACHE_CHECK(for .preinit_array/.init_array/.fini_array support,
	       libc_cv_initfinit_array, [dnl
cat > conftest.c <<EOF
int _start (void) { return 0; }
int __start (void) { return 0; }
int foo (void) { return 1; }
int (*fp) (void) __attribute__ ((section (".init_array"))) = foo;
EOF
if AC_TRY_COMMAND([${CC} $CFLAGS $CPPFLAGS -c -o conftest conftest.c
							1>&AS_MESSAGE_LOG_FD])
then
  if ${READELF} -S conftest | grep -e INIT_ARRAY > /dev/null; then
    libc_cv_initfinit_array=yes
  else
    libc_cv_initfinit_array=no
  fi
else
  libc_cv_initfinit_array=no
fi
rm -f conftest*])
AC_SUBST(libc_cv_initfinit_array)
if test $libc_cv_initfinit_array = yes; then
  AC_DEFINE_UNQUOTED(HAVE_INITFINI_ARRAY)
fi

AC_CACHE_CHECK(if $CC accepts -fno-tree-loop-distribute-patterns with \
__attribute__ ((__optimize__)), libc_cv_cc_loop_to_function, [dnl
cat > conftest.c <<EOF
void
__attribute__ ((__optimize__ ("-fno-tree-loop-distribute-patterns")))
foo (void) {}
EOF
libc_cv_cc_loop_to_function=no
if AC_TRY_COMMAND([${CC-cc} $CFLAGS $CPPFLAGS -c
			    -fno-tree-loop-distribute-patterns conftest.c])
then
  libc_cv_cc_loop_to_function=yes
fi
rm -f conftest*])
if test $libc_cv_cc_loop_to_function = yes; then
  AC_DEFINE(_HAVE_CC_INHIBIT_LOOP_TO_LIBCALL)
fi
AC_SUBST(libc_cv_cc_loop_to_function)

dnl Autoconf 2.59 doesn't support the AC_TYPE_LONG_DOUBLE macro. Instead of:
dnl   AC_TYPE_LONG_DOUBLE
dnl   AM_CONDITIONAL(HAVE_LONG_DOUBLE, test x"$ac_cv_type_long_double" = x"yes")
dnl we specify our own long double test.
dnl Additionally, ac_cv_objext is broken so that AC_COMPILE_IFELSE cannot be
dnl used, so use AC_TRY_COMMAND instead.
AC_CACHE_CHECK(whether long double type exists,
	       acmsvclib_cv_type_long_double, [dnl
cat > conftest.c <<EOF
/* Check two ways:  float.h defines and direct type declaration.  */
#include <float.h>
#if defined(LDBL_MANT_DIG)
  #define _HAVE_LONG_DOUBLE
 #else
  #error "LDBL != DBL"
#endif
long double test() {
long double ld = 0.0L;
return ld;
}
EOF
if AC_TRY_COMMAND([${CC} $CFLAGS $CPPFLAGS -c -o conftest.o conftest.c
							1>&AS_MESSAGE_LOG_FD])
then
  acmsvclib_cv_type_long_double=yes;
else
  acmsvclib_cv_type_long_double=no;
fi
rm -f conftest*])
if test $acmsvclib_cv_type_long_double = yes; then
  AC_DEFINE_UNQUOTED(_HAVE_LONG_DOUBLE)
fi
AM_CONDITIONAL(HAVE_LONG_DOUBLE, test x"$acmsvclib_cv_type_long_double" = x"yes")

AC_CACHE_CHECK(whether long double equals double,
	       msvclib_cv_ldbl_eq_dbl, [dnl
cat > conftest.c <<EOF
#include <float.h>
#if DBL_MANT_DIG == LDBL_MANT_DIG  &&  LDBL_MIN_EXP == DBL_MIN_EXP  && \
    LDBL_MAX_EXP == DBL_MAX_EXP
  #define _LDBL_EQ_DBL
 #else
  #error "LDBL != DBL"
#endif
EOF
if AC_TRY_COMMAND([${CC} $CFLAGS $CPPFLAGS -c -o conftest.o conftest.c
							1>&AS_MESSAGE_LOG_FD])
then
  msvclib_cv_ldbl_eq_dbl=yes;
else
  msvclib_cv_ldbl_eq_dbl=no;
fi
rm -f conftest*])
if test $msvclib_cv_ldbl_eq_dbl = yes; then
  AC_DEFINE_UNQUOTED(_LDBL_EQ_DBL)
fi

AC_SUBST(CFLAGS)

AC_CONFIG_FILES([Makefile],
[if test -n "$CONFIG_FILES"; then
  unset ac_file
  . ${msvclib_basedir}/../config-ml.in
fi],
srcdir=${srcdir}
host=${host}
with_multisubdir=${with_multisubdir}
ac_configure_args="${multilib_arg} ${ac_configure_args}"
CONFIG_SHELL=${CONFIG_SHELL-/bin/sh}
msvclib_basedir=${msvclib_basedir}
CC="${CC}"
LDFLAGS="${LDFLAGS}"
)
AC_OUTPUT
