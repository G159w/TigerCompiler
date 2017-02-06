/**
 ** \file ast/array-exp.hh
 ** \brief Declaration of ast::ArrayExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/name-ty.hh>

namespace ast
{

  /// ArrayExp.
  class ArrayExp : public Exp
  {
    public:
      ArrayExp(const Location& location, NameTy *arr , Exp* exp1, Exp* exp2);
      virtual ~ArrayExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const NameTy& arr_get() const;
      NameTy& arr_get();
      const Exp& exp1_get() const;
      Exp& exp1_get();
      const Exp& exp2_get() const;
      Exp& exp2_get();
  // FIXME: Some code was deleted here.
  
    protected:
      NameTy *arr_;
      Exp* exp1_;
      Exp* exp2_;

  // FIXME: Some code was deleted here.
  };

} // namespace ast

#include <ast/array-exp.hxx>

