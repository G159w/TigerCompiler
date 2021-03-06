/**
 ** \file ast/break-exp.hh
 ** \brief Declaration of ast::BreakExp.
 */

#pragma once

#include <ast/exp.hh>

namespace ast
{

  /// BreakExp.
  class BreakExp : public Exp
  {
    public:
      BreakExp(const Location& location);
      virtual ~BreakExp() = default;
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;

  };

} // namespace ast

#include <ast/break-exp.hxx>

