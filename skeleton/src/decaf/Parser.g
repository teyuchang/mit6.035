header {package decaf;}

options
{
  mangleLiteralPrefix = "TK_";
  language="Java";
}

class DecafParser extends Parser;
options
{
  importVocab=DecafScanner;
  k=3;
  buildAST=true;
}

{
	private boolean error;
	public void reportError (RecognitionException ex) {
		// Print the error via some kind of error reporting mechanism.
		error = true;
		System.out.println("Recognition Error: " + ex);
	}
	public void reportError (String s) {
		// Print the error via some kind of error reporting mechanism.
		error = true;
		System.out.println("This is the returned error string: " + s);
	}
	public boolean getError(){
		return error;
	}


	private boolean trace = false;

	public void setTrace(boolean shouldTrace) {
		trace = shouldTrace;
	}
	@Override
	public void traceIn(String rname) throws TokenStreamException {
		if (trace) {
		  super.traceIn(rname);
		}
	}
	@Override
	public void traceOut(String rname) throws TokenStreamException {
		if (trace) {
		  super.traceOut(rname);
		}
	}
}
program: TK_class ID LCURLY (field_decl)* (method_decl)* RCURLY EOF;
protected arr_decl: (ID | ID LBRAC INT_LIT RBRAC);
field_decl: type arr_decl (COMMA arr_decl)* SEMI;
protected type_id: type ID;
method_decl: (type | TK_void) ID LPAR (type_id (COMMA type_id)*)? RPAR block;
block: LCURLY (var_decl)* (statement)* RCURLY;
var_decl: type ID (COMMA ID)* SEMI;
type: TK_int | TK_boolean;
statement: location assign_op expr SEMI |
	method_call SEMI |
	TK_if LPAR expr RPAR block (TK_else block)? |
	TK_for ID ASSIGN expr COMMA expr block |
	TK_return (expr)? SEMI|
	TK_break SEMI |
	TK_continue SEMI|
	block;
assign_op: ASSIGN | PLUS_EQ | MINUS_EQ;
method_call: method_name LPAR (expr (COMMA expr)*)? RPAR |
	TK_callout LPAR STRING (COMMA (callout_arg (COMMA callout_arg)*))? RPAR;
method_name: ID;
location: ID | ID LBRAC expr RBRAC;
expr: basic_expr cal_expr;
cal_expr: (bin_op expr) |;
basic_expr:
	location|
	method_call|
	literal|
	MINUS expr|
	NOT expr|
	LPAR expr RPAR;
callout_arg: expr | STRING;
bin_op: arith_op | rel_op | eq_op | cond_op;
arith_op: PLUS | MINUS | MUL | DIV | MOD;
rel_op: GT | LT | GTE | LTE;
eq_op: EQ | NOT_EQ;
cond_op: AND | OR;
literal: INT_LIT | CHAR | STRING;
