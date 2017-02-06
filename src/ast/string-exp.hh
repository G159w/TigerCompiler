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
    StringExp(const Location& location, const std::string& name);
    virtual ~StringExp() = default;
    void accept(ConstVisitor& v) const override;
    void accept(Visitor& v) override;
    const std::string& name_get() const;
    std::string& name_get();

  protected:
    std::string name_;

  };

} // namespace ast

#include <ast/string-exp.hxx>

