/**
 ** \file ast/string-exp.hh
 ** \brief Declaration of ast::StringExp.
 */

#pragma once

#include <ast/exp.hh>
#include <string>

namespace ast
{

  /// StringExp.
  class StringExp : public Exp
  {
    public:
    StringExp(const Location& location, const misc::symbol& name);
    virtual ~StringExp() = default;
    void accept(ConstVisitor& v) const override;
    void accept(Visitor& v) override;
    const misc::symbol& name_get() const;
    misc::symbol& name_get();

  protected:
    misc::symbol name_;

  };

} // namespace ast

#include <ast/string-exp.hxx>

