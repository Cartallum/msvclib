#include <machine/syscall.h>
#include "internal_syscall.h"

/* Create a new process. Minimal implementation for a system without
   processes from msvclib documentation.  */
int _fork()
{
  errno = EAGAIN;
  return -1;
}
