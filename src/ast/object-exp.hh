/**
 ** \file ast/object-exp.hh
 ** \brief Declaration of ast::ObjectExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/name-ty.hh>

namespace ast
{

  /// ObjectExp.
  class ObjectExp : public Exp
  {
    public:
      ObjectExp(const Location& location, NameTy* name);
      virtual ~ObjectExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const NameTy& name_get() const;
      NameTy& name_get();

    protected:
      NameTy* name_;
  };

} // namespace ast

#include <ast/object-exp.hxx>

