/**
 ** \file ast/if-exp.hxx
 ** \brief Inline methods of ast::IfExp.
 */

#pragma once

#include <ast/if-exp.hh>

namespace ast
{
  inline const Exp&
  IfExp::exp1_get() const
  {
    return *exp1_;
  }
  inline Exp&
  IfExp::exp1_get()
  {
    return *exp1_;
  }

  inline const Exp&
  IfExp::exp2_get() const
  {
    return *exp2_;
  }
  inline Exp&
  IfExp::exp2_get()
  {
    return *exp2_;
  }

  inline const Exp&
  IfExp::exp3_get() const
  {
    return *exp3_;
  }
  inline Exp&
  IfExp::exp3_get()
  {
    return *exp3_;
  }
  // FIXME: Some code was deleted here.

} // namespace ast

