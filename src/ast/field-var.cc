/**
 ** \file ast/field-var.cc
 ** \brief Implementation of ast::FieldVar.
 */

#include <ast/visitor.hh>
#include <ast/field-var.hh>

namespace ast
{
  FieldVar::FieldVar(const Location& location, Var* var, misc::symbol symb)
    : Var(location)
    , var_(var)
    , symb_(symb)
  {}

  FieldVar::~FieldVar()
  {
    delete var_;
  }

  void
  FieldVar::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  FieldVar::accept(Visitor& v)
  {
    v(*this);
  }

} // namespace ast

