%{ /* -*- C++ -*- */

/* Includes, prototypes, typedefs, etc. required */
#include <iostream>
#include <sstream>
#include "parse.hh"

int comment = 1;
int error_g = 0;
  yy::parser::location_type loc_type;
/* Code for Bison/Flex Synchronization */
#define YY_DECL                                 \
  yy::parser::symbol_type yylex()
  YY_DECL;

/* Useful typedef */
using token = yy::parser::token;

/* Useful macro */
#define TOKEN(type) \
  yy::parser::make_ ## type(loc_type)

// Management of the location... OPT FIXME
// Action done at each token match
//# define YY_USER_ACTION \
do \
{ \
    loc_type.columns(yyleng); \
} while (false);

/* Management of the EOF automatically managed by the scanner and the parser */
#define yyterminate() return TOKEN(END_OF_FILE)

%}

 /* Flex options */
%option noyywrap
%option	nounput
%option debug
 /* Declaration of a new state : FIXME*/
%x COMMENT_STATE
%x STRING_STATE
 /* Regex Definition : FIXME */
SPACE           [ \t]
EOL             (\n\r|\r\n|\n|\r)
NUM             \\[0-3][0-7][0-7]
XNUM            \\x[0-7][0-9A-F]
 /* Rules */
%%



<COMMENT_STATE>{
<<eof>> {
          std::cerr << "scan error, unexpected ";
          std::cerr << yytext << std::endl;
          error_g = 2;
          BEGIN(INITIAL);
        }
{EOL}   {
          loc_type.lines();
          loc_type.step();
        }
"/*"    { comment++; }
"*/"    {
          comment--;
          if (!comment)
          {
            comment = 1;
            BEGIN(INITIAL);
          }
        }
.       { }
}
<STRING_STATE>{
<<eof>>           {
                    std::cerr << "scan error, expected \"";
                    std::cerr << yytext << std::endl;
                    BEGIN(INITIAL);
                    error_g = 2;
                    return TOKEN(STRING);
                  }
{NUM}             { }
{XNUM}            { }
{EOL}             {
                    loc_type.lines();
                    loc_type.step();
                  }
{SPACE}           {
                    loc_type.step();
                    continue;
                  }
"\\\""            {}
"\\[^\\abfnrtv]"  {
                    std::cerr << "scan error_g, unexpected \\value";
                    std::cerr << yytext << std::endl;
                    error_g = 2;
                    BEGIN(INITIAL);
                  }
"\""              {
                    BEGIN(INITIAL);
                    return TOKEN(STRING);
                  }
.                 { }
}
<<eof>> return TOKEN(END_OF_FILE);
"/*" BEGIN(COMMENT_STATE);
"array" return TOKEN(ARRAY);
"if" return TOKEN(IF);
"then" return TOKEN(THEN);
"else" return TOKEN(ELSE);
"while" return TOKEN(WHILE);
"for" return TOKEN(FOR);
"to" return TOKEN(TO);
"do" return TOKEN(DO);
"let" return TOKEN(LET);
"in" return TOKEN(IN);
"end" return TOKEN(END);
"of" return TOKEN(OF);
"break" return TOKEN(BREAK);
"nil" return TOKEN(NIL);
"function" return TOKEN(FUNCTION);
"var" return TOKEN(VAR);
"type" return TOKEN(TYPE);
"import" return TOKEN(IMPORT);
"primitive" return TOKEN(PRIMITIVE);
"class" return TOKEN(CLASS);
"extends" return TOKEN(EXTENDS);
"method" return TOKEN(METHOD);
"new" return TOKEN(NEW);
"," return TOKEN(COMA);
":" return TOKEN(DPOINT);
";" return TOKEN(POINTV);
"(" return TOKEN(PARAG);
")" return TOKEN(PARAD);
"‘" return TOKEN(SIMPLEQUOTE);
"[" return TOKEN(BRACKETG);
"]" return TOKEN(BRACKETD);
"{" return TOKEN(BRACEG);
"}" return TOKEN(BRACED);
"." return TOKEN(POINT);
"+" return TOKEN(PLUS);
"-" return TOKEN(MINUS);
"*" return TOKEN(STAR);
"/" return TOKEN(SLASH);
"=" return TOKEN(EQUAL);
"<>" return TOKEN(DIFF);
"<" return TOKEN(INF);
"<=" return TOKEN(INFEQU);
">" return TOKEN(SUP);
">=" return TOKEN(SUPEQU);
"&" return TOKEN(AND);
"|" return TOKEN(OR);
":=" return TOKEN(ASSIGN);
"_main" return TOKEN(IDENTIFIER);
"\n\r" {}
"\n"  {}
"\r\n" {}
"\r" {}
[a-zA-Z][0-9a-zA-Z_]* return TOKEN(IDENTIFIER);
[0-9]+ return TOKEN(NUM);
"\"" { BEGIN(STRING_STATE);}
{SPACE}         { }
.               {
                  std::cerr << "scan error_g, unexpected ";
                  std::cerr << yytext << std::endl;
                  error_g = 2;
                }

%%
