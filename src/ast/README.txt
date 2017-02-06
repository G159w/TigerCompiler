* README

Tiger Abstract Syntax Tree nodes with their principal members.
Incomplete classes are tagged with a `*'.

/Ast/               (Location location)
  /Dec/             (symbol name)
    FunctionDec     (VarDecs formals, NameTy result, Exp body)
      MethodDec     ()
    TypeDec         (Ty ty)
    VarDec          (NameTy type_name, Exp init)

  /Exp/             ()
    /Var/           ()
      CastVar       (Var var, Ty ty)
*     FieldVar
      SimpleVar     (symbol name)
      SubscriptVar  (Var var, Exp index)

    ArrayExp        [OK](NameTy arr, Exp exp1, Exp exp2)
    AssignExp       [OK](Var var_, Exp exp_)
    BreakExp        [OK]()
    CallExp         [OK](exps_type exps)
      MethodCallExp [OK](Var var, exps_type exps)
    CastExp         (Exp exp, Ty ty)
    ForExp          (VarDec vardec, Exp hi, Exp body)
    IfExp           [OK](Exp exp1, Exp exp2, Exp exp3)
    IntExp          (int value)
    LetExp          [OK](DecsList dec, Exp exp)
    NilExp          ()
    ObjectExp       [OK](NameTy name)
    OpExp           (Exp left, Oper oper, Exp right)
    RecordExp       [OK](NameTy arr, fieldinits_type vec)
    SeqExp          [OK](exps_type exps)
    StringExp       [OK](string name)
    WhileExp        (Exp test, Exp body)

  /Ty/              ()
    ArrayTy         (NameTy base_type)
    ClassTy         (NameTy super, DecsList decs)
    NameTy          (symbol name)
    RecordTy        [OK](Field field)

  DecsList          (decs_type decs)

  Field             (symbol name, NameTy type_name)

  FieldInit         (symbol name, Exp init)


