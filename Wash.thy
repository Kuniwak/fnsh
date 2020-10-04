theory Wash imports Main begin

datatype idVal = nat
datatype recoId = nat
datatype procName = string

datatype expr =
  (*Exec procName |*)
  (*Pipe expr expr |*)
  (*Redirect expr |*)
  IntLit int |
  StrLit string |
(*  FnLit idVal expr |*)
(*  FnCall idVal expr |*)
  RecoLit "(idVal * expr) list" |
  VarLit idVal

datatype val =
  IntVal int |
  StrVal string |
  RecoVal "(idVal * expr) list" |
  FnVal "(val * val) list" (* val \<Rightarrow> val が許容されないので泣く泣く *)

fun eval :: "expr \<Rightarrow> (idVal \<Rightarrow> val) \<Rightarrow> val" where
  "eval (IntLit n) _ = IntVal n" |
  "eval (StrLit s) _ = StrVal s" |
  "eval (RecoLit es) _ = RecoVal es" |
  "eval (VarLit i) env = env i"



(* 後でプロセス型（様相論理ベースの）を追加する *)
datatype type =
  Int |
  Str |
  Reco |
  Fn type type

end