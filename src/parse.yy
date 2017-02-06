/*
** BISON DIRECTIVES
*/
%require "3.0.2"     // The version of bison should be superior or egal to 3.0.2
%skeleton "lalr1.cc" // The grammar is lalr1
%expect 0            // No shift/reduce
%error-verbose       // Put a specific message in case of parse error_g
%defines             // Generate header files which can be used by the scanner
// Add a prefix "TOK_" to the token names to avoid colisions.
%define api.token.prefix {TOK_}
// Request that symbols be handled as a whole in the scanner.
%define api.token.constructor
// The type for semantic values set to variant
%define api.value.type variant
%debug
%locations


/*
** CODE FOR FLEX/BISON SYNCHORNIZATION
*/
%code
{
  #include <iostream>
  // Prototype of the synchronization function
  yy::parser::symbol_type yylex();
  extern int error_g;
}


/*
** TOKENS, TYPES AND PRIORITIES
*/

// Tokens
/* FIXME: Complete tokens list */
%token ARRAY
%token SPACE
%token IF
%token THEN
%token ELSE
%token WHILE
%token FOR
%token TO
%token DO
%token LET
%token IN
%token END
%token OF
%token BREAK
%token NIL
%token FUNCTION
%token VAR
%token TYPE
%token IMPORT
%token PRIMITIVE
%token CLASS
%token EXTENDS
%token METHOD
%token NEW
%token COMA ","
%token DPOINT ":"
%token POINTV ";"
%token PARAG "("
%token PARAD ")"
%token SIMPLEQUOTE
%token BRACKETG "["
%token BRACKETD "]"
%token BRACEG "{"
%token BRACED "}"
%token POINT "."
%token PLUS "+"
%token MINUS "-"
%token STAR "*"
%token SLASH "/"
%token EQUAL "=" 
%token DIFF "<>"
%token INF "<"
%token INFEQU "<="
%token SUP ">"
%token SUPEQU ">="
%token AND "&"
%token OR "|"
%token ASSIGN ":="
%token IDENTIFIER "id" 
%token STRING
%token NUM          "num"
%token TRUE        "true"
%token EOL         "\n"
%token END_OF_FILE 0 "<EOF>" // Token EOF, automaticaly managed by the parser

 // Priorities
/* FIXME: Define priorities */
%nonassoc THEN 
%nonassoc ELSE
%nonassoc DO
%nonassoc OF
%nonassoc ASSIGN
%left OR
%left AND
%nonassoc INF SUP INFEQU SUPEQU DIFF EQUAL
%left PLUS MINUS
%left STAR SLASH

// Entry point
%start program 


/*
** RULES
*/
%%
  /*MyFirstRule: {};*/


program:
  exp
  | decs

exp:
  NIL
  | "num"
  | STRING
  | "id" "[" exp "]" OF exp
  | "id" "{" "}"
  | "id" "{" rule1 "}"
  | NEW "id"
  | lvalue
  | "id" "(" ")"
  | "id" "(" rule3  ")"
  | lvalue "." "id" "(" rule3 ")"
  | "-" exp
  | exp "+" exp
  | exp "-" exp
  | exp "*" exp
  | exp "/" exp
  | exp "=" exp
  | exp "<>" exp
  | exp ">" exp
  | exp "<" exp
  | exp ">=" exp
  | exp "<=" exp
  | exp "&" exp
  | exp "|" exp
  | "("")"
  | "(" exps ")"
  | lvalue ":=" exp
  | IF exp THEN exp
  | IF exp THEN exp ELSE exp
  | WHILE exp DO exp
  | FOR "id" ":=" exp TO exp DO exp
  | BREAK
  | LET decs IN exps END
  | LET decs IN END

rule1:
  "id" "=" exp
  | "id" "=" exp rule2;

rule2:
  "," "id" "=" exp
  | "," "id" "=" exp rule2;

rule3:
  exp
  | exp rule3exp;

rule3exp:
  "," exp
  | "," exp rule3exp

lvalue: 
  "id"
  | lvalueexp

lvalueexp:
  "id" "[" exp "]"
  | lvalueexp "[" exp "]"
  | lvalue "." "id";

exps: exp
  | exp expsrec;

expsrec:
   ";" exp
  | ";" exp expsrec;

decs: %empty
  | dec decs;

dec:
  TYPE "id" "=" ty
  | CLASS "id" EXTENDS "id" "{" rule10 "}"
  | CLASS "id" "{" rule10 "}"
  | vardec
  | FUNCTION "id" "(" tyfields ")" ":" "id" "=" exp
  | FUNCTION "id" "(" tyfields ")" "=" exp
  | FUNCTION "id" "(" ")" ":" "id" "=" exp
  | FUNCTION "id" "(" ")" "=" exp
  | PRIMITIVE "id" "(" tyfields ")" ":" "id"
  | PRIMITIVE "id" "(" tyfields ")"
  | PRIMITIVE "id" "(" ")" ":" "id"
  | PRIMITIVE "id" "(" ")"
  | IMPORT STRING;

rule10:
  classfield
  | classfield rule10;

vardec: 
  VAR "id" ":" "id" ":=" exp
  | VAR "id" ":=" exp;


classfields:
    classfield

classfield:
  vardec
  | METHOD "id" "(" ")" ":" "id" "=" exp
  | METHOD "id" "(" ")" "=" exp
  | METHOD "id" "(" tyfields ")" ":" "id" "=" exp
  | METHOD "id" "(" tyfields ")" "=" exp;


ty:
  "id"
  | "{" tyfields "}"
  | "{" "}"
  | ARRAY OF "id"
  | CLASS EXTENDS "id" "{" classfields "}"
  | CLASS EXTENDS "id" "{" "}"
  | CLASS "{" classfields "}"
  | CLASS "{" "}";

tyfields:
    "id" ":" "id"
   | "id" ":" "id" rule5;

rule5:
    "," "id" ":" "id"
  | "," "id" ":" "id" rule5;


%%


/*
 ** FUNCTIONS
 */

// Parse error_g function, automaticaly call by the parser in case of parse error_g
void yy::parser::error(const location_type& loc_type, const std::string& msg)
{
  std::cerr << msg << std::endl;
  if (!error_g)
    exit(3);
}
extern int yy_flex_debug;
// Main function
int main(int argc, char *argv[])
{
  yy::parser parser;
  yy_flex_debug = 0;
  parser.set_debug_level(0);
  if (argc > 1)
    std::freopen(argv[1], "r", stdin);
  parser.parse();
  return error_g;
}
