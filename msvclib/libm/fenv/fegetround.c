/*
  (c) Copyright 2019 Joel Sherrill <joel@rtems.org
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:

  1. Redistributions of source code must retain the above copyright
     notice, this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright
     notice, this list of conditions and the following disclaimer in the
     documentation and/or other materials provided with the distribution.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
  HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <fenv.h>
#include <errno.h>

/*
FUNCTION
<<fegetround>>---get current rounding direction

INDEX
	fegetround
SYNOPSIS
	#include <fenv.h>
	int fegetround(void);

	Link with -lm.

DESCRIPTION
This method returns the current rounding direction.

RETURNS
This method returns the rounding direction, corresponding to the value
of the respective rouding macro. If the current rounding direction cannot
be determined, then a negative value is returned.

PORTABILITY
ANSI C requires <<fegetround>>.

Not all Msvclib targets have a working implementation.  Refer to
the file <<sys/fenv.h>> to see the status for your target.
*/

/*
 * This is a non-functional implementation that should be overridden
 * by an architecture specific implementation in msvclib/libm/machine/ARCH.
 */
int fegetround(void)
{
  return -ENOTSUP;
}
