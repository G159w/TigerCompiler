/**
 ** \file ast/var.hh
 ** \brief Declaration of ast::Var.
 */

#pragma once

#include <ast/exp.hh>

namespace ast
{

  /// Var.
  class Var : public Exp
  {
  public:
    /** \name Ctor & dtor.
     ** \{ */
    /// Construct a Var node.
    Var(const Location& location);
    /// Destroy a Var node.
    virtual ~Var() = default;
    /** \} */
  };

} // namespace ast

#include <ast/var.hxx>

