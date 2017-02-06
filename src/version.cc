/**								-*- C++ -*-
 ** \file version.cc
 ** \brief Common definitions.
 */

#include <config.h>
#include <authors.h>


/*-------------------.
| Program identity.  |
`-------------------*/

/** Name of this program.

Be sure to have something usable even before main is started,
in case some ctor of a static object need to issue an error
message.  */
const char *program_name = PACKAGE_NAME;

// Version string of this program.
const char *program_version =
"tc (" PACKAGE_STRING ")\n"
"$Id: e61b063b3ea752e12b03dc30f7c59b28b35a7782 $\n"
"\n"
PACKAGE_SHORT_AUTHORS;

// Bug report address of this program.
const char *program_bug_address = PACKAGE_BUGREPORT;

/// Describe program and accepted arguments.
const char *program_doc =
  "Tiger Compiler, Copyright (C) 2004-2017  LRDE.";
const char *program_args_doc = "INPUT-FILE";
