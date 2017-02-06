/**
 ** \file ast/record-exp.hh
 ** \brief Declaration of ast::RecordExp.
 */

#pragma once

#include <ast/exp.hh>
#include <ast/field-init.hh>
#include <ast/name-ty.hh>

namespace ast
{

  /// RecordExp.
  class RecordExp : public Exp
  {
    public:
      RecordExp(const Location& location, NameTy* rec, fieldinits_type vec);
      virtual ~RecordExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const NameTy& rec_get() const;
      NameTy& rec_get();
      const fieldinits_type& vec_get() const;
      fieldinits_type& vec_get();
  
    protected:
      NameTy* rec_;
      fieldinits_type vec_;

  // FIXME: Some code was deleted here.
  };

} // namespace ast

#include <ast/record-exp.hxx>

