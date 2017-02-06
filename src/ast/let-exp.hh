/**
 ** \file ast/let-exp.hh
 ** \brief Declaration of ast::LetExp.
 */

#pragma once

#include <ast/decs-list.hh>
#include <ast/exp.hh>
#include <misc/contract.hh>

namespace ast
{

  /// LetExp.
  class LetExp : public Exp
  {
    public:
      LetExp(const Location& location, DecsList* dec, Exp* exp);
      virtual ~LetExp();
      void accept(ConstVisitor& v) const override;
      void accept(Visitor& v) override;
      const DecsList& dec_get() const;
      DecsList& dec_get();;
      const Exp& exp_get() const;
      Exp& exp_get();
      
    protected:
      DecsList* dec_;
      Exp* exp_;
  // FIXME: Some code was deleted here.
  };

} // namespace ast

#include <ast/let-exp.hxx>

