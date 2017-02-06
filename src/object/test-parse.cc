/// Test the parser with object extensions.

#include <cstdlib>
#include <iostream>
#include <ast/libast.hh>
#include <ast/exp.hh>
#include <ast/decs-list.hh>
#include <parse/libparse.hh>
#include <object/libobject.hh>

const char* program_name = "test-parse";

int
main()
{
  // Canonical syntax.
  ast::Exp* e1 = parse::parse(" let"
                              " in"
                              " end",
                              true);
  std::cout << *e1 << std::endl;
  delete e1;

  // Alternative syntax.
  ast::Exp* e2 = parse::parse(" let"
                              " in"
                              " end",
                              true);
  std::cout << *e2 << std::endl;
  delete e2;
}
