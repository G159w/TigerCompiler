/**
 ** \file ast/let-exp.cc
 ** \brief Implementation of ast::LetExp.
 */

#include <ast/visitor.hh>
#include <ast/let-exp.hh>

namespace ast
{

    LetExp::LetExp(const Location& location, DecsList* dec, Exp* exp)
    : Exp(location)
    , dec_(dec)
    , exp_(exp)
  {}

  // FIXME: Some code was deleted here.

  LetExp::~LetExp()
  {
    delete exp_;
    delete dec_;
  }
  void
  LetExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  LetExp::accept(Visitor& v)
  {
    v(*this);
  }
  // FIXME: Some code was deleted here.

} // namespace ast

