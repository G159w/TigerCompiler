/**
 ** \file ast/method-call-exp.cc
 ** \brief Implementation of ast::MethodCallExp.
 */

#include <ast/visitor.hh>
#include <ast/method-call-exp.hh>

namespace ast
{
  MethodCallExp::MethodCallExp(const Location& location, Var *var, exps_type
      exps)
    : CallExp(location, exps)
    , var_(var)
  {}


  MethodCallExp::~MethodCallExp()
  {
    delete var_;
  }

  void
  MethodCallExp::accept(ConstVisitor& v) const
  {
    v(*this);
  }

  void
  MethodCallExp::accept(Visitor& v)
  {
    v(*this);
  }

} // namespace ast

