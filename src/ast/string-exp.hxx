/**
 ** \file ast/string-exp.hxx
 ** \brief Inline methods of ast::StringExp.
 */

#pragma once

#include <ast/string-exp.hh>

namespace ast
{
  inline const std::string&
  StringExp::name_get() const
  {
    return name_;
  }
  inline std::string&
  StringExp::name_get()
  {
    return name_;
  }
  // FIXME: Some code was deleted here.

} // namespace ast

