## Process this file with automake to generate Makefile.in

AUTOMAKE_OPTIONS = cygnus

INCLUDES = -I $(msvclib_basedir)/../msvclib/libm/common $(MSVCLIB_CFLAGS) \
	$(CROSS_CFLAGS) $(TARGET_CFLAGS)

if HAS_NDS32_FPU_SP_FALSE
GPR_SOURCES =
else
FPU_SP_SOURCES = wf_sqrt.S
endif

if HAS_NDS32_FPU_DP_FALSE
else
FPU_DP_SOURCES = w_sqrt.S
endif

LIB_SOURCES = $(GPR_SOURCES) $(FPU_SP_SOURCES) $(FPU_DP_SOURCES)

noinst_LIBRARIES = lib.a
lib_a_SOURCES = $(LIB_SOURCES)
lib_a_CFLAGS = $(AM_CFLAGS)
lib_a_CCASFLAGS = $(AM_CCASFLAGS)
noinst_DATA =

include $(srcdir)/../../../Makefile.shared

ACLOCAL_AMFLAGS = -I ../../.. -I ../../../..
CONFIG_STATUS_DEPENDENCIES = $(msvclib_basedir)/configure.host
