/**
 ** \file ast/object-exp.cc
 ** \brief Implementation of ast::ObjectExp.
 */

#include <ast/visitor.hh>
#include <ast/object-exp.hh>

namespace ast
{
  ObjectExp::ObjectExp(const Location& location, NameTy* name)
    : Exp(location)
    , name_(name)
  {}

  // FIXME: Some code was deleted here.

  ObjectExp::~ObjectExp()
  {
    delete name_;
  }
  void
  ObjectExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  ObjectExp::accept(Visitor& v)
  {
    v(*this);
  }
  // FIXME: Some code was deleted here.

} // namespace ast

