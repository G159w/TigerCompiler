/**
 ** \file ast/record-exp.cc
 ** \brief Implementation of ast::RecordExp.
 */

#include <misc/algorithm.hh>
#include <ast/visitor.hh>
#include <ast/record-exp.hh>

namespace ast
{
  RecordExp::RecordExp(const Location& location, NameTy* rec, fieldinits_type vec)
    : Exp(location)
    , rec_(rec)
    , vec_(vec)
  {}

  // FIXME: Some code was deleted here.

  RecordExp::~RecordExp()
  {
    delete rec_;
  }
  void
  RecordExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  RecordExp::accept(Visitor& v)
  {
    v(*this);
  }

  // FIXME: Some code was deleted here.

} // namespace ast

