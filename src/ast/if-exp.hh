/**
 ** \file ast/if-exp.hh
 ** \brief Declaration of ast::IfExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/seq-exp.hh>

namespace ast
{

  /// IfExp.
  class IfExp : public Exp
  {
    public:
      IfExp(const Location& location, Exp* exp1, Exp* exp2, Exp* exp3 = nullptr);
      virtual ~IfExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const Exp& exp1_get() const;
      Exp& exp1_get();
      const Exp& exp2_get() const;
      Exp& exp2_get();
      const Exp& exp3_get() const;
      Exp& exp3_get();
  // FIXME: Some code was deleted here.
  
    protected:
      Exp* exp1_;
      Exp* exp2_;
      Exp* exp3_;
  };
} // namespace ast

#include <ast/if-exp.hxx>

