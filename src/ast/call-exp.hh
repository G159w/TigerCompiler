/**
 ** \file ast/call-exp.hh
 ** \brief Declaration of ast::CallExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/function-dec.hh>
#include <misc/symbol.hh>

namespace ast
{

  /// CallExp.
  class CallExp : public Exp
  {
    public:
      CallExp(const Location& location, exps_type exps);
      virtual ~CallExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const exps_type& exps_get() const;
      exps_type& exps_get();
  
    protected:
      exps_type exps_;

  };

} // namespace ast

#include <ast/call-exp.hxx>

