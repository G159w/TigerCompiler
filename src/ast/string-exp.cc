/**
 ** \file ast/string-exp.cc
 ** \brief Implementation of ast::StringExp.
 */

#include <ast/visitor.hh>
#include <ast/string-exp.hh>

namespace ast
{
  StringExp::StringExp(const Location& location, const misc::symbol& name)
    : Exp(location)
    , name_(name)
  {}


  void
  StringExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  StringExp::accept(Visitor& v)
  {
    v(*this);
  }
  // FIXME: Some code was deleted here.

} // namespace ast

