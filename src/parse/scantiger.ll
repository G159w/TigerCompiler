                                                            /* -*- C++ -*- */
%option c++
%option nounput
%option debug
%option batch

%{

# include <climits>

# include <regex>
# include <string>
# include <cerrno>

# include <boost/lexical_cast.hpp>

# include <misc/contract.hh>
# include <misc/symbol.hh>
  // Using misc::escape is very useful to quote non printable characters.
  // For instance
  //
  //    std::cerr << misc::escape('\n') << std::endl;
  //
  // reports about `\n' instead of an actual new-line character.
# include <misc/escape.hh>
# include <parse/tiger-parser.hh>
# include <parse/parsetiger.hh>


  // FIXME: Some code was deleted here.
  std::string grown_string;


 // Convenient shortcuts.
#define TOKEN_VAL(Type, Value)                  \
  parser::make_ ## Type(Value, tp.location_)

#define TOKEN(Type)                             \
  parser::make_ ## Type(tp.location_)


 // Flex uses `0' for end of file.  0 is not a token_type.
#define yyterminate() return TOKEN(EOF)
#define YY_USER_ACTION                       \
  tp.location_.columns(yyleng);


# define CHECK_EXTENSION()                              \
  do {                                                  \
    if (!tp.enable_extensions_p_)                       \
      tp.error_ << misc::error::scan                    \
                << tp.location_                         \
                << ": invalid identifier: `"            \
                << misc::escape(yytext) << "'\n";       \
  } while (false)

YY_FLEX_NAMESPACE_BEGIN
%}

%x SC_COMMENT SC_STRING

 /* Abbreviations.  */

int             [0-9]+
SPACE           [ \t]
ID              [a-zA-Z][0-9a-zA-Z_]*
EOL             (\n\r|\r\n|\n|\r)
NUM             \\[0-3][0-7][0-7]
XNUM            \\x[0-7][0-9A-F]
BACK            \\[^\\abfnrtv]

  /* FIXME: Some code was deleted here. */
%%
%{
  // FIXME: Some code was deleted here (Local variables).
  int nbc = 0;
  // Each time yylex is called.
  tp.location_.step();
%}

 /* The rules.  */
<SC_COMMENT>{
<<eof>>   {
            tp.error_ << misc::error::scan << tp.location_;
            tp.error_ << ": invalid identifier: `" << misc::escape(yytext) << "'\n";  
            BEGIN(INITIAL);
          }
{EOL}     {
          }
"/*"      { nbc++; }
"*/"      {
            nbc--;
            if (!nbc)
            {
              nbc = 1;
              BEGIN(INITIAL);
            }
          }
.         { }
}
<SC_STRING>{
<<eof>>   {
            tp.error_ << misc::error::scan << tp.location_;
            tp.error_ << ": invalid identifier: `" << misc::escape(yytext) << "'\n";
            BEGIN(INITIAL);
          }
{NUM}     {
            grown_string += strtol(yytext + 1, 0, 8);
          }
{XNUM}    {
            grown_string += strtol(yytext + 2, 0, 16);
          }

{EOL}     {
            tp.location_.lines(yyleng); tp.location_.step();
          }
{SPACE}   {
            tp.location_.step();
            continue;
          }
"\\,"     {
            tp.error_ << misc::error::scan << tp.location_;
            tp.error_ << ": invalid identifier: `" << misc::escape(yytext) << "'\n";
            BEGIN(INITIAL);
          }
"\\\""    {
            grown_string += yytext;
          }
"\\\\"    {
            grown_string += yytext;
          }
"\""      {
            BEGIN(INITIAL);
            return TOKEN_VAL(STRING, grown_string);
          }
{BACK}    {
            tp.error_ << misc::error::scan << tp.location_;
            tp.error_ << ": invalid identifier: `" << misc::escape(yytext) << "'\n";
            BEGIN(INITIAL);
          }
.         {
            grown_string += yytext;
          }
}
<<eof>>       { return TOKEN(EOF); }
"\""          {
                grown_string.clear();
                BEGIN(SC_STRING);
              }
"/*"          {
                nbc = 1;
                BEGIN(SC_COMMENT);
              }
"array"       { return TOKEN(ARRAY); }
"if"          { return TOKEN(IF); }
"then"        { return TOKEN(THEN); }
"else"        { return TOKEN(ELSE); }
"while"       { return TOKEN(WHILE); }
"for"         { return TOKEN(FOR); }
"to"          { return TOKEN(TO); }
"do"          { return TOKEN(DO); }
"let"         { return TOKEN(LET); }
"in"          { return TOKEN(IN); }
"end"         { return TOKEN(END); }
"of"          { return TOKEN(OF); }
"break"       { return TOKEN(BREAK); }
"nil"         { return TOKEN(NIL); }
"function"    { return TOKEN(FUNCTION); }
"var"         { return TOKEN(VAR); }
"type"        { return TOKEN(TYPE); }
"import"      { return TOKEN(IMPORT); }
"primitive"   { return TOKEN(PRIMITIVE); }
"class"       {
                if (!tp.enable_object_extensions_p_)
                  tp.error_ << misc::error::scan
                  << tp.location_
                  << ": invalid identifier: `"
                  << misc::escape(yytext) << "'\n";
                else
                  return TOKEN(CLASS);
              }
"extends"     {
                if (!tp.enable_object_extensions_p_)
                  tp.error_ << misc::error::scan
                  << tp.location_
                  << ": invalid identifier: `"
                  << misc::escape(yytext) << "'\n";
                else
                  return TOKEN(EXTENDS);
              }
"method"      {
                if (!tp.enable_object_extensions_p_)
                  tp.error_ << misc::error::scan
                  << tp.location_
                  << ": invalid identifier: `"
                  << misc::escape(yytext) << "'\n";
                else
                  return TOKEN(METHOD);
              }
"new"         {
                if (!tp.enable_object_extensions_p_)
                  tp.error_ << misc::error::scan
                  << tp.location_
                  << ": invalid identifier: `"
                  << misc::escape(yytext) << "'\n";
                else
                  return TOKEN(NEW);
              }
","           { return TOKEN(COMMA); }
":"           { return TOKEN(COLON); }
";"           { return TOKEN(SEMI); }
"("           { return TOKEN(LPAREN); }
")"           { return TOKEN(RPAREN); }
"["           { return TOKEN(LBRACK); }
"]"           { return TOKEN(RBRACK); }
"{"           { return TOKEN(LBRACE); }
"}"           { return TOKEN(RBRACE); }
"."           { return TOKEN(DOT); }
"+"           { return TOKEN(PLUS); }
"-"           { return TOKEN(MINUS); }
"*"           { return TOKEN(TIMES); }
"/"           { return TOKEN(DIVIDE); }
"="           { return TOKEN(EQ); }
"<>"          { return TOKEN(NE); }
"<"           { return TOKEN(LT); }
"<="          { return TOKEN(LE); }
">"           { return TOKEN(GT); }
">="          { return TOKEN(GE); }
"&"           { return TOKEN(AND); }
"|"           { return TOKEN(OR); }
":="          { return TOKEN(ASSIGN); }
"_main"       {
                misc::symbol sy("_main");
                return TOKEN_VAL(ID, sy);
              }
{SPACE}       {
                tp.location_.step();
                continue;
              }
{ID}          {
                misc::symbol sy(yytext);
                return TOKEN_VAL(ID, sy);
              }
{EOL}         { tp.location_.lines(yyleng);}
{int}         {
                int val = 0;
                val = strtoul(yytext, nullptr, 10);
                if (errno == ERANGE)
                {
                  tp.error_ << misc::error::scan
                  << tp.location_
                  << ": invalid identifier: `"
                  << misc::escape(yytext) << "'\n";
                }
                else
                  return TOKEN_VAL(INT, val);
              }
.             {
                tp.error_ << misc::error::scan << tp.location_;
                tp.error_ << ": invalid identifier: `" << misc::escape(yytext) << "'\n";
              }

  /* FIXME: Some code was deleted here. */
%%

 // Do not use %option noyywrap, because then flex generates the same
 // definition of yywrap, but outside the namespaces, so it defines it
 // for ::yyFlexLexer instead of ::parse::yyFlexLexer.
int yyFlexLexer::yywrap() { return 1; }

void
yyFlexLexer::scan_open_(std::istream& f)
{
  yypush_buffer_state(YY_CURRENT_BUFFER);
  yy_switch_to_buffer(yy_create_buffer(&f, YY_BUF_SIZE));
}

void
yyFlexLexer::scan_close_()
{
  yypop_buffer_state();
}

YY_FLEX_NAMESPACE_END
