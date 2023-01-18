/* $NetBSD: cargf.c,v 1.1 2007/08/20 16:01:31 drochner Exp $ */

/*
 * Written by Matthias Drochner <drochner@NetBSD.org>.
 * Public domain.
 *
 * imported and modified include for msvclib 2010/10/03 
 * Marco Atzeri <marco_atzeri@yahoo.it>
 */

#include <complex.h>
#include <math.h>

float
cargf(float complex z)
{

	return atan2f( cimagf(z), crealf(z) );
}
