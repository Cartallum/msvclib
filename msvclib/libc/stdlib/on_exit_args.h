#ifndef MSVCLIB_CYGWIN_MSVCLIB_LIBC_STDLIB_ON_EXIT_ARGS_H_
#define MSVCLIB_CYGWIN_MSVCLIB_LIBC_STDLIB_ON_EXIT_ARGS_H_

#include <reent.h>

#ifdef _REENT_SMALL

extern struct _on_exit_args * const __on_exit_args;

#endif	/* def _REENT_SMALL */

#endif	/* def MSVCLIB_CYGWIN_MSVCLIB_LIBC_STDLIB_ON_EXIT_ARGS_H_ */
