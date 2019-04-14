package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class AritExpreMult implements ASTNode {

	ASTNode op1;
	ASTNode op2;
	Boolean op;
	
	public AritExpreMult(ASTNode op1, ASTNode op2, Boolean op) {
		super();
		this.op1 = op1;
		this.op2 = op2;
		this.op = op;
	}

	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		if(op){
			return (Object)((Double)op1.execute(symbolTable)*(Double)op2.execute(symbolTable));
		}else{
			return (Object)((Double)op1.execute(symbolTable)/(Double)op2.execute(symbolTable));
		}
		
	}

}
