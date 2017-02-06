/**
 ** \file ast/if-exp.cc
 ** \brief Implementation of ast::IfExp.
 */

#include <ast/visitor.hh>
#include <ast/if-exp.hh>

namespace ast
{
  IfExp::IfExp(const Location& location, Exp* exp1, Exp* exp2, Exp* exp3)
    : Exp(location)
    , exp1_(exp1)
    , exp2_(exp2)
    , exp3_(exp3)
  {}

  // FIXME: Some code was deleted here.

  IfExp::~IfExp()
  {
    delete exp1_;
    delete exp2_;
    if (exp3_)
      delete exp3_;
  }
  void
  IfExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  IfExp::accept(Visitor& v)
  {
    v(*this);
  }
} // namespace ast

