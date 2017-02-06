/**
 ** \file ast/array-exp.hxx
 ** \brief Inline methods of ast::ArrayExp.
 */

#pragma once

#include <ast/array-exp.hh>

namespace ast
{
  inline const NameTy&
  ArrayExp::arr_get() const
  {
    return *arr_;
  }
  inline NameTy&
  ArrayExp::arr_get()
  {
    return *arr_;
  }

  inline const Exp&
  ArrayExp::exp1_get() const
  {
    return *exp1_;
  }
  inline Exp&
  ArrayExp::exp1_get()
  {
    return *exp1_;
  }

  inline const Exp&
  ArrayExp::exp2_get() const
  {
    return *exp2_;
  }
  inline Exp&
  ArrayExp::exp2_get()
  {
    return *exp2_;
  }
  
  // FIXME: Some code was deleted here.

} // namespace ast

