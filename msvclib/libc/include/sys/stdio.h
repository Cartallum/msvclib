#ifndef _MSVCLIB_STDIO_H
#define _MSVCLIB_STDIO_H

#include <sys/lock.h>
#include <sys/reent.h>

/* Internal locking macros, used to protect stdio functions.  In the
   general case, expand to nothing. Use __SSTR flag in FILE _flags to
   detect if FILE is private to sprintf/sscanf class of functions; if
   set then do nothing as lock is not initialised. */
#if !defined(_flockfile)
#ifndef __SINGLE_THREAD__
#  define _flockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_acquire_recursive((fp)->_lock))
#else
#  define _flockfile(fp)	((void) 0)
#endif
#endif

#if !defined(_funlockfile)
#ifndef __SINGLE_THREAD__
#  define _funlockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_release_recursive((fp)->_lock))
#else
#  define _funlockfile(fp)	((void) 0)
#endif
#endif

#endif /* _MSVCLIB_STDIO_H */
