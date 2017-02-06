/**
 ** \file ast/record-ty.hxx
 ** \brief Inline methods of ast::RecordTy.
 */

#pragma once

#include <ast/record-ty.hh>

namespace ast
{

  inline const Field&
  RecordTy::base_type_get() const
  {
    return *field_;
  }
  inline Field&
  RecordTy::base_type_get()
  {
    return *field_;
  }

} // namespace ast

