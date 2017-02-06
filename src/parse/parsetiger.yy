                                                                // -*- C++ -*-
%require "3.0"
%language "C++"
// Set the namespace name to `parse', instead of `yy'.
%name-prefix "parse"
%define api.value.type variant
%define api.token.constructor

  // FIXME: Some code was deleted here (Other directives: %skeleton "lalr1.cc" %expect 0 etc).
%error-verbose
%defines
%debug
// Prefix all the tokens with TOK_ to avoid colisions.
%define api.token.prefix {TOK_}

/* We use pointers to store the filename in the locations.  This saves
   space (pointers), time (no deep copy), but leaves the problem of
   deallocation.  This would be a perfect job for a misc::symbol
   object (passed by reference), however Bison locations require the
   filename to be passed as a pointer, thus forcing us to handle the
   allocation and deallocation of this object.

   Nevertheless, all is not lost: we can still use a misc::symbol
   object to allocate a flyweight (constant) string in the pool of
   symbols, extract it from the misc::symbol object, and use it to
   initialize the location.  The allocated data will be freed at the
   end of the program (see the documentation of misc::symbol and
   misc::unique).  */
%define filename_type {const std::string}
%locations

// The parsing context.
%param { ::parse::TigerParser& tp }

/*---------------------.
| Support for tokens.  |
`---------------------*/
%code requires
{
#include <string>
#include <misc/algorithm.hh>
#include <misc/separator.hh>
#include <misc/symbol.hh>
#include <parse/fwd.hh>

  // Pre-declare parse::parse to allow a ``reentrant'' parsing within
  // the parser.
  namespace parse
  {
    ast_type parse(Tweast& input);
  }
}

%code provides
{
  // Announce to Flex the prototype we want for lexing (member) function.
  # define YY_DECL_(Prefix)                               \
    ::parse::parser::symbol_type                          \
    (Prefix parselex)(::parse::TigerParser& tp)
  # define YY_DECL YY_DECL_(yyFlexLexer::)
}

%printer { yyo << $$; } <int> <std::string> <misc::symbol>;

%token <std::string>    STRING "string"
%token <misc::symbol>   ID     "identifier"
%token <int>            INT    "integer"


/*--------------------------------.
| Support for the non-terminals.  |
`--------------------------------*/

%code requires
{
# include <ast/fwd.hh>
// Provide the declarations of the following classes for the
// %destructor clauses below to work properly.
# include <ast/exp.hh>
# include <ast/var.hh>
# include <ast/ty.hh>
# include <ast/name-ty.hh>
# include <ast/field.hh>
# include <ast/field-init.hh>
# include <ast/function-dec.hh>
# include <ast/type-dec.hh>
# include <ast/var-dec.hh>
# include <ast/any-decs.hh>
# include <ast/decs-list.hh>
}

  // FIXME: Some code was deleted here (Printers and destructors).


/*-----------------------------------------.
| Code output in the implementation file.  |
`-----------------------------------------*/

%code
{
# include <parse/tiger-parser.hh>
# include <parse/scantiger.hh>
# include <parse/tweast.hh>
# include <misc/separator.hh>
# include <misc/symbol.hh>
# include <ast/all.hh>
# include <ast/libast.hh>

  namespace
  {
    /// Get the metavar from the specified map.
    template <typename T>
    T*
    metavar(parse::TigerParser& tp, unsigned key)
    {
      parse::Tweast* input = tp.input_;
      return input->template take<T>(key);
    }

  }

  /// Use our local scanner object.
  inline
  ::parse::parser::symbol_type
  parselex(parse::TigerParser& tp)
  {
    return tp.scanner_->parselex(tp);
  }
}

// Definition of the tokens, and their pretty-printing.
%token AND          "&"
       ARRAY        "array"
       ASSIGN       ":="
       BREAK        "break"
       CAST         "_cast"
       CLASS        "class"
       COLON        ":"
       COMMA        ","
       DIVIDE       "/"
       DO           "do"
       DOT          "."
       ELSE         "else"
       END          "end"
       EQ           "="
       EXTENDS      "extends"
       FOR          "for"
       FUNCTION     "function"
       GE           ">="
       GT           ">"
       IF           "if"
       IMPORT       "import"
       IN           "in"
       LBRACE       "{"
       LBRACK       "["
       LE           "<="
       LET          "let"
       LPAREN       "("
       LT           "<"
       MINUS        "-"
       METHOD       "method"
       NE           "<>"
       NEW          "new"
       NIL          "nil"
       OF           "of"
       OR           "|"
       PLUS         "+"
       PRIMITIVE    "primitive"
       RBRACE       "}"
       RBRACK       "]"
       RPAREN       ")"
       SEMI         ";"
       THEN         "then"
       TIMES        "*"
       TO           "to"
       TYPE         "type"
       VAR          "var"
       WHILE        "while"
       EOF 0         "end of file"

%type <ast::Exp*> exp
%type <ast::DecsList*> decs
  // FIXME: Some code was deleted here (More %types).

%nonassoc THEN
%nonassoc ELSE
%nonassoc DO
%nonassoc OF
%nonassoc ASSIGN
%left OR
%left AND
%nonassoc LE LT NE EQ GT GE
%left PLUS MINUS
%left TIMES DIVIDE
  // FIXME: Some code was deleted here (Priorities/associativities).
%start program

%%
program:
  /* Parsing a source program.  */
  exp   { tp.ast_ = $1; }
| /* Parsing an imported file.  */
  decs  { tp.ast_ = $1; }
;

exp:
  NIL
  | INT
  | STRING
  | ID "[" exp "]" OF exp
  | ID LBRACE RBRACE
  | ID LBRACE rule1 RBRACE
  | NEW ID
  | lvalue
  | ID LPAREN RPAREN
  | ID LPAREN rule3 RPAREN
  | lvalue DOT ID LPAREN rule3 RPAREN
  | MINUS exp
  | exp PLUS exp
  | exp MINUS exp
  | exp TIMES exp
  | exp DIVIDE exp
  | exp EQ exp
  | exp NE exp
  | exp GT exp
  | exp LT exp
  | exp GE exp
  | exp LE exp
  | exp AND exp
  | exp OR exp
  | LPAREN RPAREN
  | LPAREN exps RPAREN
  | lvalue ASSIGN exp
  | IF exp THEN exp
  | IF exp THEN exp ELSE exp
  | WHILE exp DO exp
  | FOR ID ASSIGN exp TO exp DO exp
  | BREAK
  | LET decs IN exps END
  | LET decs IN END
;

rule1:
  ID EQ exp
  | ID EQ exp rule2
;

rule2:
  COMMA ID EQ exp
  | COMMA ID EQ exp rule2
;

rule3:
  exp
  | exp rule3exp
;

rule3exp:
  COMMA exp
  | COMMA exp rule3exp
;

lvalue:
  ID
  | lvalueexp
;

lvalueexp:
  ID LBRACK exp RBRACK
  | lvalue DOT ID
  | lvalueexp LBRACK exp RBRACK
;

exps: exp
  | exp expsrec
;

expsrec:
  SEMI exp
  | SEMI exp expsrec

;

decs:
  %empty
  | dec decs
;

dec:
  TYPE ID EQ ty
  | CLASS ID EXTENDS ID LBRACE rule10 RBRACE
  | CLASS ID LBRACE rule10 RBRACE
  | vardec
  | FUNCTION ID LPAREN tyfields RPAREN COLON ID EQ exp
  | FUNCTION ID LPAREN tyfields RPAREN EQ exp
  | FUNCTION ID LPAREN RPAREN COLON ID EQ exp
  | FUNCTION ID LPAREN RPAREN EQ exp
  | PRIMITIVE ID LPAREN tyfields RPAREN COLON ID
  | PRIMITIVE ID LPAREN tyfields RPAREN
  | PRIMITIVE ID LPAREN RPAREN COLON ID
  | PRIMITIVE ID LPAREN RPAREN
  | IMPORT STRING
;

rule10:
  classfield
  | classfield rule10
;

vardec:
  VAR ID COLON ID ASSIGN exp
  | VAR ID ASSIGN exp
;

classfields:
  classfield
;

classfield:
  vardec
  | METHOD ID LPAREN tyfields RPAREN COLON ID EQ exp
  | METHOD ID LPAREN tyfields RPAREN EQ exp
  | METHOD ID LPAREN RPAREN COLON ID EQ exp
  | METHOD ID LPAREN RPAREN EQ exp
;

ty:
  ID
  | LBRACE tyfields RBRACE
  | LBRACE RBRACE
  | ARRAY OF ID
  | CLASS EXTENDS ID LBRACE classfields RBRACE
  | CLASS EXTENDS ID LBRACE RBRACE
  | CLASS LBRACE classfields RBRACE
  | CLASS LBRACE RBRACE
;

tyfields:
  ID COLON ID
  | ID COLON ID rule5
;

rule5:
  COMMA ID COLON ID
  | COMMA ID COLON ID rule5
;
  //INT
   //{ $$ = new ast::IntExp(@$, $1); }
  // FIXME: Some code was deleted here (More rules).

/*---------------.
| Declarations.  |
`---------------*/

%token DECS "_decs";
//decs:
  //%empty                { $$ = new ast::DecsList(@$); }
  // FIXME: Some code was deleted here (More rules).
%%

void
parse::parser::error(const location_type& l, const std::string& m)
{
  std::cerr << m << std::endl;
  tp.error_ << misc::error::parse << l;
// FIXME: Some code was deleted here.
}
