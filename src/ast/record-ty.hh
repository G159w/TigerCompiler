/**
 ** \file ast/record-ty.hh
 ** \brief Declaration of ast::RecordTy.
 */

#pragma once

#include <ast/field.hh>
#include <ast/ty.hh>

namespace ast
{

  /// RecordTy.
  class RecordTy : public Ty
  {
    public:
      RecordTy(const location& location, Field* field);
      virtual ~RecordTy();
      void accept(constvisitor& v) const override;
      void accept(visitor& v) override;
      const Field& field_get() const;
      Field& field_get();

    protected:
      Field* field_;

  };

} // namespace ast

#include <ast/record-ty.hxx>

