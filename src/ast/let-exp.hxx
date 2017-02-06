/**
 ** \file ast/let-exp.hxx
 ** \brief Inline methods of ast::LetExp.
 */

#pragma once

#include <ast/let-exp.hh>

namespace ast
{
  inline const DecsList&
  LetExp::dec_get() const
  {
    return *dec_;
  }
  inline DecsList&
  LetExp::dec_get()
  {
    return *dec_;
  }

  inline const Exp&
  LetExp::exp_get() const
  {
    return *exp_;
  }
  inline Exp&
  LetExp::exp_get()
  {
    return *exp_;
  }

  // FIXME: Some code was deleted here.

} // namespace ast

