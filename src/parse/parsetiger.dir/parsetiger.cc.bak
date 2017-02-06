// A Bison parser, made by GNU Bison 3.0.4.

// Skeleton implementation for Bison LALR(1) parsers in C++

// Copyright (C) 2002-2015 Free Software Foundation, Inc.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// As a special exception, you may create a larger work that contains
// part or all of the Bison parser skeleton and distribute that work
// under terms of your choice, so long as that work isn't itself a
// parser generator using the skeleton or a modified version thereof
// as a parser skeleton.  Alternatively, if you modify or redistribute
// the parser skeleton itself, you may (at your option) remove this
// special exception, which will cause the skeleton and the resulting
// Bison output files to be licensed under the GNU General Public
// License without this special exception.

// This special exception was added by the Free Software Foundation in
// version 2.2 of Bison.

// Take the name prefix into account.
#define yylex   parselex

// First part of user declarations.

#line 39 "parse/parsetiger.cc" // lalr1.cc:404

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

#include "parsetiger.hh"

// User implementation prologue.

#line 53 "parse/parsetiger.cc" // lalr1.cc:412
// Unqualified %code blocks.
#line 100 "parse/parsetiger.yy" // lalr1.cc:413

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

#line 86 "parse/parsetiger.cc" // lalr1.cc:413


#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> // FIXME: INFRINGES ON USER NAME SPACE.
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

#define YYRHSLOC(Rhs, K) ((Rhs)[K].location)
/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

# ifndef YYLLOC_DEFAULT
#  define YYLLOC_DEFAULT(Current, Rhs, N)                               \
    do                                                                  \
      if (N)                                                            \
        {                                                               \
          (Current).begin  = YYRHSLOC (Rhs, 1).begin;                   \
          (Current).end    = YYRHSLOC (Rhs, N).end;                     \
        }                                                               \
      else                                                              \
        {                                                               \
          (Current).begin = (Current).end = YYRHSLOC (Rhs, 0).end;      \
        }                                                               \
    while (/*CONSTCOND*/ false)
# endif


// Suppress unused-variable warnings by "using" E.
#define YYUSE(E) ((void) (E))

// Enable debugging if requested.
#if YYDEBUG

// A pseudo ostream that takes yydebug_ into account.
# define YYCDEBUG if (yydebug_) (*yycdebug_)

# define YY_SYMBOL_PRINT(Title, Symbol)         \
  do {                                          \
    if (yydebug_)                               \
    {                                           \
      *yycdebug_ << Title << ' ';               \
      yy_print_ (*yycdebug_, Symbol);           \
      *yycdebug_ << std::endl;                  \
    }                                           \
  } while (false)

# define YY_REDUCE_PRINT(Rule)          \
  do {                                  \
    if (yydebug_)                       \
      yy_reduce_print_ (Rule);          \
  } while (false)

# define YY_STACK_PRINT()               \
  do {                                  \
    if (yydebug_)                       \
      yystack_print_ ();                \
  } while (false)

#else // !YYDEBUG

# define YYCDEBUG if (false) std::cerr
# define YY_SYMBOL_PRINT(Title, Symbol)  YYUSE(Symbol)
# define YY_REDUCE_PRINT(Rule)           static_cast<void>(0)
# define YY_STACK_PRINT()                static_cast<void>(0)

#endif // !YYDEBUG

#define yyerrok         (yyerrstatus_ = 0)
#define yyclearin       (yyla.clear ())

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYRECOVERING()  (!!yyerrstatus_)


namespace parse {
#line 172 "parse/parsetiger.cc" // lalr1.cc:479

  /* Return YYSTR after stripping away unnecessary quotes and
     backslashes, so that it's suitable for yyerror.  The heuristic is
     that double-quoting is unnecessary unless the string contains an
     apostrophe, a comma, or backslash (other than backslash-backslash).
     YYSTR is taken from yytname.  */
  std::string
  parser::yytnamerr_ (const char *yystr)
  {
    if (*yystr == '"')
      {
        std::string yyr = "";
        char const *yyp = yystr;

        for (;;)
          switch (*++yyp)
            {
            case '\'':
            case ',':
              goto do_not_strip_quotes;

            case '\\':
              if (*++yyp != '\\')
                goto do_not_strip_quotes;
              // Fall through.
            default:
              yyr += *yyp;
              break;

            case '"':
              return yyr;
            }
      do_not_strip_quotes: ;
      }

    return yystr;
  }


  /// Build a parser object.
  parser::parser (::parse::TigerParser& tp_yyarg)
    :
#if YYDEBUG
      yydebug_ (false),
      yycdebug_ (&std::cerr),
#endif
      tp (tp_yyarg)
  {}

  parser::~parser ()
  {}


  /*---------------.
  | Symbol types.  |
  `---------------*/



  // by_state.
  inline
  parser::by_state::by_state ()
    : state (empty_state)
  {}

  inline
  parser::by_state::by_state (const by_state& other)
    : state (other.state)
  {}

  inline
  void
  parser::by_state::clear ()
  {
    state = empty_state;
  }

  inline
  void
  parser::by_state::move (by_state& that)
  {
    state = that.state;
    that.clear ();
  }

  inline
  parser::by_state::by_state (state_type s)
    : state (s)
  {}

  inline
  parser::symbol_number_type
  parser::by_state::type_get () const
  {
    if (state == empty_state)
      return empty_symbol;
    else
      return yystos_[state];
  }

  inline
  parser::stack_symbol_type::stack_symbol_type ()
  {}


  inline
  parser::stack_symbol_type::stack_symbol_type (state_type s, symbol_type& that)
    : super_type (s, that.location)
  {
      switch (that.type_get ())
    {
      case 65: // decs
        value.move< ast::DecsList* > (that.value);
        break;

      case 56: // exp
        value.move< ast::Exp* > (that.value);
        break;

      case 5: // "integer"
        value.move< int > (that.value);
        break;

      case 4: // "identifier"
        value.move< misc::symbol > (that.value);
        break;

      case 3: // "string"
        value.move< std::string > (that.value);
        break;

      default:
        break;
    }

    // that is emptied.
    that.type = empty_symbol;
  }

  inline
  parser::stack_symbol_type&
  parser::stack_symbol_type::operator= (const stack_symbol_type& that)
  {
    state = that.state;
      switch (that.type_get ())
    {
      case 65: // decs
        value.copy< ast::DecsList* > (that.value);
        break;

      case 56: // exp
        value.copy< ast::Exp* > (that.value);
        break;

      case 5: // "integer"
        value.copy< int > (that.value);
        break;

      case 4: // "identifier"
        value.copy< misc::symbol > (that.value);
        break;

      case 3: // "string"
        value.copy< std::string > (that.value);
        break;

      default:
        break;
    }

    location = that.location;
    return *this;
  }


  template <typename Base>
  inline
  void
  parser::yy_destroy_ (const char* yymsg, basic_symbol<Base>& yysym) const
  {
    if (yymsg)
      YY_SYMBOL_PRINT (yymsg, yysym);
  }

#if YYDEBUG
  template <typename Base>
  void
  parser::yy_print_ (std::ostream& yyo,
                                     const basic_symbol<Base>& yysym) const
  {
    std::ostream& yyoutput = yyo;
    YYUSE (yyoutput);
    symbol_number_type yytype = yysym.type_get ();
    // Avoid a (spurious) G++ 4.8 warning about "array subscript is
    // below array bounds".
    if (yysym.empty ())
      std::abort ();
    yyo << (yytype < yyntokens_ ? "token" : "nterm")
        << ' ' << yytname_[yytype] << " ("
        << yysym.location << ": ";
    switch (yytype)
    {
            case 3: // "string"

#line 63 "parse/parsetiger.yy" // lalr1.cc:636
        { yyo << yysym.value.template as< std::string > (); }
#line 379 "parse/parsetiger.cc" // lalr1.cc:636
        break;

      case 4: // "identifier"

#line 63 "parse/parsetiger.yy" // lalr1.cc:636
        { yyo << yysym.value.template as< misc::symbol > (); }
#line 386 "parse/parsetiger.cc" // lalr1.cc:636
        break;

      case 5: // "integer"

#line 63 "parse/parsetiger.yy" // lalr1.cc:636
        { yyo << yysym.value.template as< int > (); }
#line 393 "parse/parsetiger.cc" // lalr1.cc:636
        break;


      default:
        break;
    }
    yyo << ')';
  }
#endif

  inline
  void
  parser::yypush_ (const char* m, state_type s, symbol_type& sym)
  {
    stack_symbol_type t (s, sym);
    yypush_ (m, t);
  }

  inline
  void
  parser::yypush_ (const char* m, stack_symbol_type& s)
  {
    if (m)
      YY_SYMBOL_PRINT (m, s);
    yystack_.push (s);
  }

  inline
  void
  parser::yypop_ (unsigned int n)
  {
    yystack_.pop (n);
  }

#if YYDEBUG
  std::ostream&
  parser::debug_stream () const
  {
    return *yycdebug_;
  }

  void
  parser::set_debug_stream (std::ostream& o)
  {
    yycdebug_ = &o;
  }


  parser::debug_level_type
  parser::debug_level () const
  {
    return yydebug_;
  }

  void
  parser::set_debug_level (debug_level_type l)
  {
    yydebug_ = l;
  }
#endif // YYDEBUG

  inline parser::state_type
  parser::yy_lr_goto_state_ (state_type yystate, int yysym)
  {
    int yyr = yypgoto_[yysym - yyntokens_] + yystate;
    if (0 <= yyr && yyr <= yylast_ && yycheck_[yyr] == yystate)
      return yytable_[yyr];
    else
      return yydefgoto_[yysym - yyntokens_];
  }

  inline bool
  parser::yy_pact_value_is_default_ (int yyvalue)
  {
    return yyvalue == yypact_ninf_;
  }

  inline bool
  parser::yy_table_value_is_error_ (int yyvalue)
  {
    return yyvalue == yytable_ninf_;
  }

  int
  parser::parse ()
  {
    // State.
    int yyn;
    /// Length of the RHS of the rule being reduced.
    int yylen = 0;

    // Error handling.
    int yynerrs_ = 0;
    int yyerrstatus_ = 0;

    /// The lookahead symbol.
    symbol_type yyla;

    /// The locations where the error started and ended.
    stack_symbol_type yyerror_range[3];

    /// The return value of parse ().
    int yyresult;

    // FIXME: This shoud be completely indented.  It is not yet to
    // avoid gratuitous conflicts when merging into the master branch.
    try
      {
    YYCDEBUG << "Starting parse" << std::endl;


    /* Initialize the stack.  The initial state will be set in
       yynewstate, since the latter expects the semantical and the
       location values to have been already stored, initialize these
       stacks with a primary value.  */
    yystack_.clear ();
    yypush_ (YY_NULLPTR, 0, yyla);

    // A new symbol was pushed on the stack.
  yynewstate:
    YYCDEBUG << "Entering state " << yystack_[0].state << std::endl;

    // Accept?
    if (yystack_[0].state == yyfinal_)
      goto yyacceptlab;

    goto yybackup;

    // Backup.
  yybackup:

    // Try to take a decision without lookahead.
    yyn = yypact_[yystack_[0].state];
    if (yy_pact_value_is_default_ (yyn))
      goto yydefault;

    // Read a lookahead token.
    if (yyla.empty ())
      {
        YYCDEBUG << "Reading a token: ";
        try
          {
            symbol_type yylookahead (yylex (tp));
            yyla.move (yylookahead);
          }
        catch (const syntax_error& yyexc)
          {
            error (yyexc);
            goto yyerrlab1;
          }
      }
    YY_SYMBOL_PRINT ("Next token is", yyla);

    /* If the proper action on seeing token YYLA.TYPE is to reduce or
       to detect an error, take that action.  */
    yyn += yyla.type_get ();
    if (yyn < 0 || yylast_ < yyn || yycheck_[yyn] != yyla.type_get ())
      goto yydefault;

    // Reduce or error.
    yyn = yytable_[yyn];
    if (yyn <= 0)
      {
        if (yy_table_value_is_error_ (yyn))
          goto yyerrlab;
        yyn = -yyn;
        goto yyreduce;
      }

    // Count tokens shifted since error; after three, turn off error status.
    if (yyerrstatus_)
      --yyerrstatus_;

    // Shift the lookahead token.
    yypush_ ("Shifting", yyn, yyla);
    goto yynewstate;

  /*-----------------------------------------------------------.
  | yydefault -- do the default action for the current state.  |
  `-----------------------------------------------------------*/
  yydefault:
    yyn = yydefact_[yystack_[0].state];
    if (yyn == 0)
      goto yyerrlab;
    goto yyreduce;

  /*-----------------------------.
  | yyreduce -- Do a reduction.  |
  `-----------------------------*/
  yyreduce:
    yylen = yyr2_[yyn];
    {
      stack_symbol_type yylhs;
      yylhs.state = yy_lr_goto_state_(yystack_[yylen].state, yyr1_[yyn]);
      /* Variants are always initialized to an empty instance of the
         correct type. The default '$$ = $1' action is NOT applied
         when using variants.  */
        switch (yyr1_[yyn])
    {
      case 65: // decs
        yylhs.value.build< ast::DecsList* > ();
        break;

      case 56: // exp
        yylhs.value.build< ast::Exp* > ();
        break;

      case 5: // "integer"
        yylhs.value.build< int > ();
        break;

      case 4: // "identifier"
        yylhs.value.build< misc::symbol > ();
        break;

      case 3: // "string"
        yylhs.value.build< std::string > ();
        break;

      default:
        break;
    }


      // Compute the default @$.
      {
        slice<stack_symbol_type, stack_type> slice (yystack_, yylen);
        YYLLOC_DEFAULT (yylhs.location, slice, yylen);
      }

      // Perform the reduction.
      YY_REDUCE_PRINT (yyn);
      try
        {
          switch (yyn)
            {
  case 2:
#line 201 "parse/parsetiger.yy" // lalr1.cc:859
    { tp.ast_ = yystack_[0].value.as< ast::Exp* > (); }
#line 633 "parse/parsetiger.cc" // lalr1.cc:859
    break;

  case 3:
#line 203 "parse/parsetiger.yy" // lalr1.cc:859
    { tp.ast_ = yystack_[0].value.as< ast::DecsList* > (); }
#line 639 "parse/parsetiger.cc" // lalr1.cc:859
    break;


#line 643 "parse/parsetiger.cc" // lalr1.cc:859
            default:
              break;
            }
        }
      catch (const syntax_error& yyexc)
        {
          error (yyexc);
          YYERROR;
        }
      YY_SYMBOL_PRINT ("-> $$ =", yylhs);
      yypop_ (yylen);
      yylen = 0;
      YY_STACK_PRINT ();

      // Shift the result of the reduction.
      yypush_ (YY_NULLPTR, yylhs);
    }
    goto yynewstate;

  /*--------------------------------------.
  | yyerrlab -- here on detecting error.  |
  `--------------------------------------*/
  yyerrlab:
    // If not already recovering from an error, report this error.
    if (!yyerrstatus_)
      {
        ++yynerrs_;
        error (yyla.location, yysyntax_error_ (yystack_[0].state, yyla));
      }


    yyerror_range[1].location = yyla.location;
    if (yyerrstatus_ == 3)
      {
        /* If just tried and failed to reuse lookahead token after an
           error, discard it.  */

        // Return failure if at end of input.
        if (yyla.type_get () == yyeof_)
          YYABORT;
        else if (!yyla.empty ())
          {
            yy_destroy_ ("Error: discarding", yyla);
            yyla.clear ();
          }
      }

    // Else will try to reuse lookahead token after shifting the error token.
    goto yyerrlab1;


  /*---------------------------------------------------.
  | yyerrorlab -- error raised explicitly by YYERROR.  |
  `---------------------------------------------------*/
  yyerrorlab:

    /* Pacify compilers like GCC when the user code never invokes
       YYERROR and the label yyerrorlab therefore never appears in user
       code.  */
    if (false)
      goto yyerrorlab;
    yyerror_range[1].location = yystack_[yylen - 1].location;
    /* Do not reclaim the symbols of the rule whose action triggered
       this YYERROR.  */
    yypop_ (yylen);
    yylen = 0;
    goto yyerrlab1;

  /*-------------------------------------------------------------.
  | yyerrlab1 -- common code for both syntax error and YYERROR.  |
  `-------------------------------------------------------------*/
  yyerrlab1:
    yyerrstatus_ = 3;   // Each real token shifted decrements this.
    {
      stack_symbol_type error_token;
      for (;;)
        {
          yyn = yypact_[yystack_[0].state];
          if (!yy_pact_value_is_default_ (yyn))
            {
              yyn += yyterror_;
              if (0 <= yyn && yyn <= yylast_ && yycheck_[yyn] == yyterror_)
                {
                  yyn = yytable_[yyn];
                  if (0 < yyn)
                    break;
                }
            }

          // Pop the current state because it cannot handle the error token.
          if (yystack_.size () == 1)
            YYABORT;

          yyerror_range[1].location = yystack_[0].location;
          yy_destroy_ ("Error: popping", yystack_[0]);
          yypop_ ();
          YY_STACK_PRINT ();
        }

      yyerror_range[2].location = yyla.location;
      YYLLOC_DEFAULT (error_token.location, yyerror_range, 2);

      // Shift the error token.
      error_token.state = yyn;
      yypush_ ("Shifting", error_token);
    }
    goto yynewstate;

    // Accept.
  yyacceptlab:
    yyresult = 0;
    goto yyreturn;

    // Abort.
  yyabortlab:
    yyresult = 1;
    goto yyreturn;

  yyreturn:
    if (!yyla.empty ())
      yy_destroy_ ("Cleanup: discarding lookahead", yyla);

    /* Do not reclaim the symbols of the rule whose action triggered
       this YYABORT or YYACCEPT.  */
    yypop_ (yylen);
    while (1 < yystack_.size ())
      {
        yy_destroy_ ("Cleanup: popping", yystack_[0]);
        yypop_ ();
      }

    return yyresult;
  }
    catch (...)
      {
        YYCDEBUG << "Exception caught: cleaning lookahead and stack"
                 << std::endl;
        // Do not try to display the values of the reclaimed symbols,
        // as their printer might throw an exception.
        if (!yyla.empty ())
          yy_destroy_ (YY_NULLPTR, yyla);

        while (1 < yystack_.size ())
          {
            yy_destroy_ (YY_NULLPTR, yystack_[0]);
            yypop_ ();
          }
        throw;
      }
  }

  void
  parser::error (const syntax_error& yyexc)
  {
    error (yyexc.location, yyexc.what());
  }

  // Generate an error message.
  std::string
  parser::yysyntax_error_ (state_type yystate, const symbol_type& yyla) const
  {
    // Number of reported tokens (one for the "unexpected", one per
    // "expected").
    size_t yycount = 0;
    // Its maximum.
    enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
    // Arguments of yyformat.
    char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];

    /* There are many possibilities here to consider:
       - If this state is a consistent state with a default action, then
         the only way this function was invoked is if the default action
         is an error action.  In that case, don't check for expected
         tokens because there are none.
       - The only way there can be no lookahead present (in yyla) is
         if this state is a consistent state with a default action.
         Thus, detecting the absence of a lookahead is sufficient to
         determine that there is no unexpected or expected token to
         report.  In that case, just report a simple "syntax error".
       - Don't assume there isn't a lookahead just because this state is
         a consistent state with a default action.  There might have
         been a previous inconsistent state, consistent state with a
         non-default action, or user semantic action that manipulated
         yyla.  (However, yyla is currently not documented for users.)
       - Of course, the expected token list depends on states to have
         correct lookahead information, and it depends on the parser not
         to perform extra reductions after fetching a lookahead from the
         scanner and before detecting a syntax error.  Thus, state
         merging (from LALR or IELR) and default reductions corrupt the
         expected token list.  However, the list is correct for
         canonical LR with one exception: it will still contain any
         token that will not be accepted due to an error action in a
         later state.
    */
    if (!yyla.empty ())
      {
        int yytoken = yyla.type_get ();
        yyarg[yycount++] = yytname_[yytoken];
        int yyn = yypact_[yystate];
        if (!yy_pact_value_is_default_ (yyn))
          {
            /* Start YYX at -YYN if negative to avoid negative indexes in
               YYCHECK.  In other words, skip the first -YYN actions for
               this state because they are default actions.  */
            int yyxbegin = yyn < 0 ? -yyn : 0;
            // Stay within bounds of both yycheck and yytname.
            int yychecklim = yylast_ - yyn + 1;
            int yyxend = yychecklim < yyntokens_ ? yychecklim : yyntokens_;
            for (int yyx = yyxbegin; yyx < yyxend; ++yyx)
              if (yycheck_[yyx + yyn] == yyx && yyx != yyterror_
                  && !yy_table_value_is_error_ (yytable_[yyx + yyn]))
                {
                  if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                    {
                      yycount = 1;
                      break;
                    }
                  else
                    yyarg[yycount++] = yytname_[yyx];
                }
          }
      }

    char const* yyformat = YY_NULLPTR;
    switch (yycount)
      {
#define YYCASE_(N, S)                         \
        case N:                               \
          yyformat = S;                       \
        break
        YYCASE_(0, YY_("syntax error"));
        YYCASE_(1, YY_("syntax error, unexpected %s"));
        YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
        YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
        YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
        YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
#undef YYCASE_
      }

    std::string yyres;
    // Argument number.
    size_t yyi = 0;
    for (char const* yyp = yyformat; *yyp; ++yyp)
      if (yyp[0] == '%' && yyp[1] == 's' && yyi < yycount)
        {
          yyres += yytnamerr_ (yyarg[yyi++]);
          ++yyp;
        }
      else
        yyres += *yyp;
    return yyres;
  }


  const signed char parser::yypact_ninf_ = -109;

  const signed char parser::yytable_ninf_ = -1;

  const short int
  parser::yypact_[] =
  {
      64,  -109,   113,  -109,  -109,    20,    56,    67,   224,     1,
      77,   128,   224,    87,  -109,   104,   106,   108,   224,    35,
     491,    -5,    91,  -109,    77,  -109,    21,   224,   166,   -15,
     114,    92,    -4,  -109,    98,  -109,   268,    94,    -8,  -109,
     102,   117,    53,   304,  -109,   224,   224,   224,   224,   224,
     224,   224,   224,   224,   224,   224,   224,   224,   139,   224,
    -109,   125,  -109,   103,   327,  -109,   359,   107,   143,    31,
     224,    -3,   224,   205,   224,  -109,  -109,    17,    76,   224,
     144,   224,   535,  -109,   556,   556,   556,   556,   556,    -8,
     556,   514,    -8,  -109,   491,   119,   382,   224,  -109,   115,
     224,  -109,  -109,   127,   152,   118,  -109,    31,   245,   145,
       4,   122,   414,  -109,   140,   268,   156,   129,  -109,   133,
      89,    34,  -109,   491,   168,   491,   224,  -109,   445,   224,
     359,    31,   132,  -109,  -109,   224,   173,   174,   224,    22,
     224,  -109,  -109,   177,   171,   180,   181,    41,  -109,   146,
     224,   141,   188,  -109,   491,  -109,   150,    18,   468,   183,
     175,   491,   195,   224,   491,  -109,   197,  -109,   178,  -109,
     162,  -109,  -109,   491,  -109,   194,  -109,    99,   170,   224,
     212,  -109,   224,   198,   491,  -109,    70,  -109,   224,   215,
     224,   111,   491,   208,   491,   224,  -109,   179,   445,   202,
     491,   220,   224,   221,   491,  -109,  -109,   224,   213,   491,
     183,   491,   224,  -109,   491
  };

  const unsigned char
  parser::yydefact_[] =
  {
      55,     6,    46,     5,    35,     0,     0,     0,     0,     0,
      55,     0,     0,     0,     4,     0,     0,     0,     0,     0,
       2,    11,    47,     3,    55,    60,     0,     0,     0,     0,
       0,     0,     0,    69,     0,    28,    51,     0,    15,    10,
       0,     0,     0,     0,     1,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      56,     0,     8,     0,     0,    12,    42,     0,     0,     0,
       0,     0,     0,     0,     0,    52,    29,     0,     0,     0,
       0,     0,    26,    19,    20,    24,    22,    25,    23,    17,
      21,    27,    16,    18,    30,    49,     0,     0,     9,    48,
       0,    43,    13,     0,     0,     0,    75,    70,     0,     0,
       0,     0,    31,    37,     0,    53,    68,     0,    80,     0,
       0,     0,    57,    73,     0,    33,     0,    50,    38,     0,
      44,     0,     0,    59,    71,     0,     0,     0,     0,     0,
       0,    36,    54,     0,    66,     0,     0,     0,    82,     0,
       0,     0,     0,    39,     7,    45,     0,     0,     0,    88,
       0,    64,     0,     0,    32,    67,     0,    83,     0,    87,
       0,    74,    81,    72,    14,     0,    58,     0,     0,     0,
       0,    89,     0,     0,    62,    65,     0,    86,     0,     0,
       0,     0,    34,     0,    63,     0,    85,     0,    40,     0,
      79,     0,     0,     0,    61,    84,    41,     0,     0,    77,
      90,    78,     0,    91,    76
  };

  const short int
  parser::yypgoto_[] =
  {
    -109,  -109,     0,  -109,    33,   109,   110,  -109,  -109,   161,
     123,    83,  -109,   -98,     7,    55,  -108,  -109,   -63,    36
  };

  const short int
  parser::yydefgoto_[] =
  {
      -1,    19,    36,    63,   153,    67,   101,    21,    22,    37,
      75,    23,    24,   105,   106,   170,   107,   122,   111,   181
  };

  const short int
  parser::yytable_[] =
  {
      20,   109,    45,    57,    33,    68,    46,    25,    32,   134,
      46,    58,    38,    69,   117,    47,   137,    25,    43,    48,
      49,   109,   109,   138,    29,    61,    50,    64,    66,    51,
      52,    25,    53,   156,   162,    44,    54,    55,   109,   171,
      56,   163,   110,    72,    56,    82,    83,    84,    85,    86,
      87,    88,    89,    90,    91,    92,    93,    94,   149,    96,
      30,    79,   116,   177,    62,    80,   104,     1,     2,     3,
     108,    31,   112,     4,   115,     5,   104,   148,   171,   123,
     118,   125,    17,   119,   169,     6,     7,   120,     5,     8,
       9,    39,    17,    34,   178,    10,    11,   128,    12,     7,
     130,    13,    14,     9,   121,   104,    15,    60,    40,   146,
      41,   189,    42,   196,    16,    17,    18,   147,   190,    15,
      59,    17,    70,   201,    71,    73,    66,    16,    17,   154,
     202,     1,     2,     3,    77,   158,    78,     4,   161,    76,
     164,    26,    27,    95,    97,    28,    98,   103,   124,     6,
     173,   126,   102,     8,   129,   131,   132,   136,   141,    10,
      11,   133,    12,   184,   157,    13,    14,   139,   143,     1,
       2,     3,   145,    35,   144,     4,   150,   159,   160,   192,
      18,   165,   194,   166,   167,   168,   174,     6,   198,   172,
     200,     8,   175,   176,   182,   204,   180,    10,    11,   183,
      12,   185,   209,    13,    14,   187,   186,   211,     1,     2,
       3,    65,   214,   188,     4,   191,   193,   195,    18,   199,
     203,   207,   205,   113,   208,   210,     6,     1,     2,     3,
       8,   206,   212,     4,   114,   151,    10,    11,   142,    12,
     155,   197,    13,    14,     0,     6,   213,     0,     0,     8,
       0,    45,     0,     0,     0,    10,    11,    18,    12,    46,
       0,    13,    14,     0,    47,     0,     0,     0,    48,    49,
       0,     0,     0,     0,    45,    50,    18,     0,    51,    52,
       0,    53,    46,     0,     0,    54,    55,    47,     0,     0,
       0,    48,    49,    56,   135,     0,     0,     0,    50,     0,
       0,    51,    52,     0,    53,     0,     0,     0,    54,    55,
      45,     0,     0,     0,    74,     0,    56,     0,    46,    81,
       0,     0,     0,    47,     0,     0,     0,    48,    49,     0,
       0,     0,     0,    45,    50,     0,     0,    51,    52,     0,
      53,    46,     0,     0,    54,    55,    47,     0,     0,     0,
      48,    49,    56,     0,     0,     0,     0,    50,     0,     0,
      51,    52,     0,    53,     0,    45,     0,    54,    55,     0,
       0,    99,   100,    46,     0,    56,     0,     0,    47,     0,
       0,     0,    48,    49,     0,     0,     0,     0,    45,    50,
       0,     0,    51,    52,     0,    53,    46,     0,     0,    54,
      55,    47,     0,     0,     0,    48,    49,    56,     0,     0,
       0,     0,    50,     0,     0,    51,    52,     0,    53,     0,
      45,     0,    54,    55,     0,     0,   127,     0,    46,     0,
      56,   140,     0,    47,     0,     0,     0,    48,    49,     0,
       0,     0,     0,     0,    50,     0,     0,    51,    52,     0,
      53,    45,     0,     0,    54,    55,     0,     0,   152,    46,
       0,     0,    56,     0,    47,     0,     0,     0,    48,    49,
       0,     0,     0,     0,    45,    50,     0,     0,    51,    52,
       0,    53,    46,   179,     0,    54,    55,    47,     0,     0,
       0,    48,    49,    56,     0,     0,     0,    45,    50,     0,
       0,    51,    52,     0,    53,    46,     0,     0,    54,    55,
      47,     0,     0,     0,    48,    49,    56,     0,     0,     0,
      45,    50,     0,     0,    51,    52,     0,    53,    46,     0,
       0,    54,    55,    47,     0,     0,     0,    48,    49,    56,
       0,     0,     0,     0,    50,     0,     0,    51,    52,    46,
      53,     0,     0,     0,    47,    55,     0,     0,    48,    49,
       0,     0,    56,     0,     0,    50,     0,     0,    51,    52,
      46,    53,     0,     0,     0,    -1,    55,     0,     0,    -1,
      -1,     0,     0,    56,     0,     0,    -1,     0,     0,    -1,
      52,     0,    -1,     0,     0,     0,     0,    55,     0,     0,
       0,     0,     0,     0,    56
  };

  const short int
  parser::yycheck_[] =
  {
       0,     4,     6,     8,     3,    20,    14,     0,     8,   107,
      14,    16,    12,    28,    77,    19,    12,    10,    18,    23,
      24,     4,     4,    19,     4,     4,    30,    27,    28,    33,
      34,    24,    36,   131,    12,     0,    40,    41,     4,   147,
      48,    19,    45,    47,    48,    45,    46,    47,    48,    49,
      50,    51,    52,    53,    54,    55,    56,    57,   121,    59,
       4,     8,    45,    45,    43,    12,    35,     3,     4,     5,
      70,     4,    72,     9,    74,    11,    35,    43,   186,    79,
       4,    81,    51,     7,    43,    21,    22,    11,    11,    25,
      26,     4,    51,    10,   157,    31,    32,    97,    34,    22,
     100,    37,    38,    26,    28,    35,    42,    24,     4,    20,
       4,    12,     4,    43,    50,    51,    52,    28,    19,    42,
      29,    51,     8,    12,    32,    27,   126,    50,    51,   129,
      19,     3,     4,     5,    32,   135,    19,     9,   138,    45,
     140,    28,    29,     4,    19,    32,    43,     4,     4,    21,
     150,    32,    45,    25,    39,    28,     4,    12,    18,    31,
      32,    43,    34,   163,    32,    37,    38,    45,    12,     3,
       4,     5,    39,    45,    45,     9,     8,     4,     4,   179,
      52,     4,   182,    12,     4,     4,    45,    21,   188,    43,
     190,    25,     4,    43,    19,   195,    13,    31,    32,     4,
      34,     4,   202,    37,    38,    43,    28,   207,     3,     4,
       5,    45,   212,    19,     9,    45,     4,    19,    52,     4,
      12,    19,    43,    18,     4,     4,    21,     3,     4,     5,
      25,   198,    19,     9,    73,   126,    31,    32,   115,    34,
     130,   186,    37,    38,    -1,    21,   210,    -1,    -1,    25,
      -1,     6,    -1,    -1,    -1,    31,    32,    52,    34,    14,
      -1,    37,    38,    -1,    19,    -1,    -1,    -1,    23,    24,
      -1,    -1,    -1,    -1,     6,    30,    52,    -1,    33,    34,
      -1,    36,    14,    -1,    -1,    40,    41,    19,    -1,    -1,
      -1,    23,    24,    48,    49,    -1,    -1,    -1,    30,    -1,
      -1,    33,    34,    -1,    36,    -1,    -1,    -1,    40,    41,
       6,    -1,    -1,    -1,    46,    -1,    48,    -1,    14,    15,
      -1,    -1,    -1,    19,    -1,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,     6,    30,    -1,    -1,    33,    34,    -1,
      36,    14,    -1,    -1,    40,    41,    19,    -1,    -1,    -1,
      23,    24,    48,    -1,    -1,    -1,    -1,    30,    -1,    -1,
      33,    34,    -1,    36,    -1,     6,    -1,    40,    41,    -1,
      -1,    44,    13,    14,    -1,    48,    -1,    -1,    19,    -1,
      -1,    -1,    23,    24,    -1,    -1,    -1,    -1,     6,    30,
      -1,    -1,    33,    34,    -1,    36,    14,    -1,    -1,    40,
      41,    19,    -1,    -1,    -1,    23,    24,    48,    -1,    -1,
      -1,    -1,    30,    -1,    -1,    33,    34,    -1,    36,    -1,
       6,    -1,    40,    41,    -1,    -1,    44,    -1,    14,    -1,
      48,    17,    -1,    19,    -1,    -1,    -1,    23,    24,    -1,
      -1,    -1,    -1,    -1,    30,    -1,    -1,    33,    34,    -1,
      36,     6,    -1,    -1,    40,    41,    -1,    -1,    13,    14,
      -1,    -1,    48,    -1,    19,    -1,    -1,    -1,    23,    24,
      -1,    -1,    -1,    -1,     6,    30,    -1,    -1,    33,    34,
      -1,    36,    14,    15,    -1,    40,    41,    19,    -1,    -1,
      -1,    23,    24,    48,    -1,    -1,    -1,     6,    30,    -1,
      -1,    33,    34,    -1,    36,    14,    -1,    -1,    40,    41,
      19,    -1,    -1,    -1,    23,    24,    48,    -1,    -1,    -1,
       6,    30,    -1,    -1,    33,    34,    -1,    36,    14,    -1,
      -1,    40,    41,    19,    -1,    -1,    -1,    23,    24,    48,
      -1,    -1,    -1,    -1,    30,    -1,    -1,    33,    34,    14,
      36,    -1,    -1,    -1,    19,    41,    -1,    -1,    23,    24,
      -1,    -1,    48,    -1,    -1,    30,    -1,    -1,    33,    34,
      14,    36,    -1,    -1,    -1,    19,    41,    -1,    -1,    23,
      24,    -1,    -1,    48,    -1,    -1,    30,    -1,    -1,    33,
      34,    -1,    36,    -1,    -1,    -1,    -1,    41,    -1,    -1,
      -1,    -1,    -1,    -1,    48
  };

  const unsigned char
  parser::yystos_[] =
  {
       0,     3,     4,     5,     9,    11,    21,    22,    25,    26,
      31,    32,    34,    37,    38,    42,    50,    51,    52,    55,
      56,    61,    62,    65,    66,    68,    28,    29,    32,     4,
       4,     4,    56,     3,    65,    45,    56,    63,    56,     4,
       4,     4,     4,    56,     0,     6,    14,    19,    23,    24,
      30,    33,    34,    36,    40,    41,    48,     8,    16,    29,
      65,     4,    43,    57,    56,    45,    56,    59,    20,    28,
       8,    32,    47,    27,    46,    64,    45,    32,    19,     8,
      12,    15,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,     4,    56,    19,    43,    44,
      13,    60,    45,     4,    35,    67,    68,    70,    56,     4,
      45,    72,    56,    18,    63,    56,    45,    72,     4,     7,
      11,    28,    71,    56,     4,    56,    32,    44,    56,    39,
      56,    28,     4,    43,    67,    49,    12,    12,    19,    45,
      17,    18,    64,    12,    45,    39,    20,    28,    43,    72,
       8,    59,    13,    58,    56,    60,    67,    32,    56,     4,
       4,    56,    12,    19,    56,     4,    12,     4,     4,    43,
      69,    70,    43,    56,    45,     4,    43,    45,    72,    15,
      13,    73,    19,     4,    56,     4,    28,    43,    19,    12,
      19,    45,    56,     4,    56,    19,    43,    69,    56,     4,
      56,    12,    19,    12,    56,    43,    58,    19,     4,    56,
       4,    56,    19,    73,    56
  };

  const unsigned char
  parser::yyr1_[] =
  {
       0,    54,    55,    55,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    56,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    57,    57,
      58,    58,    59,    59,    60,    60,    61,    61,    62,    62,
      62,    63,    63,    64,    64,    65,    65,    66,    66,    66,
      66,    66,    66,    66,    66,    66,    66,    66,    66,    66,
      67,    67,    68,    68,    69,    70,    70,    70,    70,    70,
      71,    71,    71,    71,    71,    71,    71,    71,    72,    72,
      73,    73
  };

  const unsigned char
  parser::yyr2_[] =
  {
       0,     2,     1,     1,     1,     1,     1,     6,     3,     4,
       2,     1,     3,     4,     6,     2,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     3,     3,     3,     2,     3,
       3,     4,     6,     4,     8,     1,     5,     4,     3,     4,
       4,     5,     1,     2,     2,     3,     1,     1,     4,     3,
       4,     1,     2,     2,     3,     0,     2,     4,     7,     5,
       1,     9,     7,     8,     6,     7,     5,     6,     4,     2,
       1,     2,     6,     4,     1,     1,     9,     7,     8,     6,
       1,     3,     2,     3,     6,     5,     4,     3,     3,     4,
       4,     5
  };



  // YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
  // First, the terminals, then, starting at \a yyntokens_, nonterminals.
  const char*
  const parser::yytname_[] =
  {
  "\"end of file\"", "error", "$undefined", "\"string\"",
  "\"identifier\"", "\"integer\"", "\"&\"", "\"array\"", "\":=\"",
  "\"break\"", "\"_cast\"", "\"class\"", "\":\"", "\",\"", "\"/\"",
  "\"do\"", "\".\"", "\"else\"", "\"end\"", "\"=\"", "\"extends\"",
  "\"for\"", "\"function\"", "\">=\"", "\">\"", "\"if\"", "\"import\"",
  "\"in\"", "\"{\"", "\"[\"", "\"<=\"", "\"let\"", "\"(\"", "\"<\"",
  "\"-\"", "\"method\"", "\"<>\"", "\"new\"", "\"nil\"", "\"of\"", "\"|\"",
  "\"+\"", "\"primitive\"", "\"}\"", "\"]\"", "\")\"", "\";\"", "\"then\"",
  "\"*\"", "\"to\"", "\"type\"", "\"var\"", "\"while\"", "\"_decs\"",
  "$accept", "program", "exp", "rule1", "rule2", "rule3", "rule3exp",
  "lvalue", "lvalueexp", "exps", "expsrec", "decs", "dec", "rule10",
  "vardec", "classfields", "classfield", "ty", "tyfields", "rule5", YY_NULLPTR
  };

#if YYDEBUG
  const unsigned short int
  parser::yyrline_[] =
  {
       0,   201,   201,   203,   207,   208,   209,   210,   211,   212,
     213,   214,   215,   216,   217,   218,   219,   220,   221,   222,
     223,   224,   225,   226,   227,   228,   229,   230,   231,   232,
     233,   234,   235,   236,   237,   238,   239,   240,   244,   245,
     249,   250,   254,   255,   259,   260,   264,   265,   269,   270,
     271,   274,   275,   279,   280,   285,   286,   290,   291,   292,
     293,   294,   295,   296,   297,   298,   299,   300,   301,   302,
     306,   307,   311,   312,   316,   320,   321,   322,   323,   324,
     328,   329,   330,   331,   332,   333,   334,   335,   339,   340,
     344,   345
  };

  // Print the state stack on the debug stream.
  void
  parser::yystack_print_ ()
  {
    *yycdebug_ << "Stack now";
    for (stack_type::const_iterator
           i = yystack_.begin (),
           i_end = yystack_.end ();
         i != i_end; ++i)
      *yycdebug_ << ' ' << i->state;
    *yycdebug_ << std::endl;
  }

  // Report on the debug stream that the rule \a yyrule is going to be reduced.
  void
  parser::yy_reduce_print_ (int yyrule)
  {
    unsigned int yylno = yyrline_[yyrule];
    int yynrhs = yyr2_[yyrule];
    // Print the symbols being reduced, and their result.
    *yycdebug_ << "Reducing stack by rule " << yyrule - 1
               << " (line " << yylno << "):" << std::endl;
    // The symbols being reduced.
    for (int yyi = 0; yyi < yynrhs; yyi++)
      YY_SYMBOL_PRINT ("   $" << yyi + 1 << " =",
                       yystack_[(yynrhs) - (yyi + 1)]);
  }
#endif // YYDEBUG



} // parse
#line 1228 "parse/parsetiger.cc" // lalr1.cc:1167
#line 359 "parse/parsetiger.yy" // lalr1.cc:1168


void
parse::parser::error(const location_type& l, const std::string& m)
{
  std::cerr << m << std::endl;
  tp.error_ << misc::error::parse << l;
// FIXME: Some code was deleted here.
}
