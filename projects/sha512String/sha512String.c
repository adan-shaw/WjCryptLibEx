////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  sha512String
//
//  Outputs SHA512 hash of a string specified on command line. Hash is output in hex
//
//  This is free and unencumbered software released into the public domain - June 2013 waterjuice.org
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  IMPORTS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "sha512.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  FUNCTIONS
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  main
//
//  Program entry point
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int main (int ArgC, char **ArgV)
{
	char *string;
	Sha512Context sha512Context;
	SHA512_HASH sha512Hash;
	uint16_t i;

	if (2 != ArgC)
	{
		printf ("Syntax\n" "   sha512String <String>\n");
		return 1;
	}

	string = ArgV[1];

	Sha512Initialise (&sha512Context);
	Sha512Update (&sha512Context, string, (uint32_t) strlen (string));
	Sha512Finalise (&sha512Context, &sha512Hash);

	for (i = 0; i < sizeof (sha512Hash); i++)
	{
		printf ("%2.2x", sha512Hash.bytes[i]);
	}
	printf ("\n");

	return 0;
}
