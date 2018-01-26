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
