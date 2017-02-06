/**
 ** \file ast/field-var.hxx
 ** \brief Inline methods of ast::FieldVar.
 */

#pragma once

#include <ast/field-var.hh>

namespace ast
{
  inline const Var&
  FieldVar::var_get() const
  {
    return *var_;
  }
  inline Var&
  FieldVar::var_get()
  {
    return *var_;
  }

  inline const misc::symbol&
  FieldVar::symb_get() const
  {
    return symb_;
  }
  inline misc::symbol&
  FieldVar::symb_get()
  {
    return symb_;
  }

} // namespace ast

