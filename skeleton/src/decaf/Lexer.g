header {package decaf;}

options 
{
  mangleLiteralPrefix = "TK_";
  language="Java";
}

class DecafScanner extends Lexer;
options 
{
  k=2;
}

tokens 
{
  "boolean";
  "break";
  "callout";
  "class";
  "continue";
  "else";
  "false";
  "for";
  "if";
  "int";
  "return";
  "true";
  "void";
}

LCURLY options { paraphrase = "{"; } : "{";
RCURLY options { paraphrase = "}"; } : "}";

ID options { paraphrase = "an identifier"; } : 
  ALPHA (ALP_NUM)*;

INT_LIT : DEC_LIT | HEX_LIT;
PLUS: "+";
MINUS: "-";
NOT: "!";
MUL: "*";
DIV: "/";
MOD: "%";
GT: ">";
LT: "<";
GTE: ">=";
LTE: "<=";
EQ: "==";
NOT_EQ: "!=";
AND: "&&";
OR: "||";
ASSIGN: "=";
PLUS_EQ: "+=";
MINUS_EQ: "-=";
COMMA: ",";
COLON: ":";
LBRAC: "[";
RBRAC: "]";
SEMI options { paraphrase = ";"; } : ";";
LPAR options { paraphrase = "("; } : "(";
RPAR options { paraphrase = ")"; } : ")";


WS_ : (' ' | '\t' | '\n' {newline();}) {_ttype = Token.SKIP; };

SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

CHAR : '\'' (ESC|~('"' | '\'' | '\\' | '\n' | '\t')) '\'';
STRING : '"' (ESC|~('"' | '\'' | '\\' | '\n' | '\t'))* '"';

protected
ESC :  '\\' ('n'|'"'|'t'|'\\'|'\'');
protected
DEC_LIT : (DIGIT)+;
protected
DIGIT : '0'..'9';
protected
HEX_DIG : DIGIT | 'a'..'f' | 'A'..'F';
protected
HEX_LIT : "0x" (HEX_DIG)+;
protected
ALPHA : ('a'..'z' | 'A'..'Z' | '_');
protected
ALP_NUM : ALPHA | DIGIT;

