/**
 ** \file ast/record-exp.hxx
 ** \brief Inline methods of ast::RecordExp.
 */

#pragma once

#include <ast/record-exp.hh>

namespace ast
{

  inline const NameTy&
  RecordExp::rec_get() const
  {
    return *rec_;
  }
  inline NameTy&
  RecordExp::rec_get()
  {
    return *rec_;
  }

  inline const fieldinits_type&
  RecordExp::vec_get() const
  {
    return vec_;
  }
  inline fieldinits_type&
  RecordExp::vec_get()
  {
    return vec_;
  }

  // FIXME: Some code was deleted here.

} // namespace ast

