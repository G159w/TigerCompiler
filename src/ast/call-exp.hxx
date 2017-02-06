/**
 ** \file ast/call-exp.hxx
 ** \brief Inline methods of ast::CallExp.
 */

#pragma once

#include <ast/call-exp.hh>

namespace ast
{
  inline const exps_type&
  CallExp::exps_get() const
  {
    return exps_;
  }
  inline exps_type&
  CallExp::exps_get()
  {
    return exps_;
  }

} // namespace ast

