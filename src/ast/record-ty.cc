/**
 ** \file ast/record-ty.cc
 ** \brief Implementation of ast::RecordTy.
 */

#include <misc/algorithm.hh>
#include <ast/visitor.hh>
#include <ast/record-ty.hh>

namespace ast
{
  RecordTy::RecordTy(const Location& location, Field* field)
    : Ty(location)
    , field_(field)
  {}

  RecordTy::~RecordTy()
  {
    delete field_;
  }

  void
  RecordTy::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  RecordTy::accept(Visitor& v)
  {
    v(*this);
  }

} // namespace ast

