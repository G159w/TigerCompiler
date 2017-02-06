/**
 ** \file ast/field-var.hh
 ** \brief Declaration of ast::FieldVar.
 */

#pragma once

#include <ast/var.hh>
#include <misc/symbol.hh>

namespace ast
{

  /// FieldVar.
  class FieldVar : public Var
  {
    public:
      FieldVar(const Location& location, Var* var, misc::symbol symb);
      virtual ~FieldVar();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const Var& var_get() const;
      Var& var_get();
      const misc::symbol& symb_get() const;
      misc::symbol& symb_get();
    protected:
      Var* var_;
      misc::symbol symb_;
  };

} // namespace ast

#include <ast/field-var.hxx>

