/**
 ** \file ast/array-exp.cc
 ** \brief Implementation of ast::ArrayExp.
 */

#include <ast/visitor.hh>
#include <ast/array-exp.hh>

namespace ast
{
  ArrayExp::ArrayExp(const Location& location, NameTy* arr, Exp* exp1, Exp* exp2)
    : Exp(location)
    , arr_(arr)
    , exp1_(exp1)
    , exp2_(exp2)
  {}

  // FIXME: Some code was deleted here.

  ArrayExp::~ArrayExp()
  {
    delete arr_;
    delete exp1_;
    delete exp2_;
  }
  void
  ArrayExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  ArrayExp::accept(Visitor& v)
  {
    v(*this);
  }

  // FIXME: Some code was deleted here.

} // namespace ast

