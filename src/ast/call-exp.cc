/**
 ** \file ast/call-exp.cc
 ** \brief Implementation of ast::CallExp.
 */

#include <misc/algorithm.hh>
#include <ast/visitor.hh>
#include <ast/call-exp.hh>

namespace ast
{
  CallExp::CallExp(const Location& location, exps_type exps)
    : Exp(location)
    , exps_(exps)
  {}

  // FIXME: Some code was deleted here.

  CallExp::~CallExp()
  {
  }
  void
  CallExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  CallExp::accept(Visitor& v)
  {
    v(*this);
  }
  // FIXME: Some code was deleted here.

} // namespace ast

