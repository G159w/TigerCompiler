/**
 ** \file ast/assign-exp.hh
 ** \brief Declaration of ast::AssignExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/var.hh>

namespace ast
{

  /// AssignExp.
  class AssignExp : public Exp
  {
    public:
      AssignExp(const Location& location, Var *var, Exp* exp);
      virtual ~AssignExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const Exp& exp_get() const;
      Exp& exp_get();
      const Var& var_get() const;
      Var& var_get();
  // FIXME: Some code was deleted here.
  
    protected:
      Var* var_;
      Exp* exp_;

  // FIXME: Some code was deleted here.
  };

} // namespace ast

#include <ast/assign-exp.hxx>

