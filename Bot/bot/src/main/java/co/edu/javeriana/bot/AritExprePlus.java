package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class AritExprePlus implements ASTNode {

	ASTNode op1;
	ASTNode op2;
	
	boolean bandera;
	public AritExprePlus(ASTNode op1, ASTNode op2, boolean bandera) {
		super();
		this.op1 = op1;
		this.op2 = op2;
		this.bandera=bandera;
	}
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		if(bandera)
		return (Object)((Double)op1.execute(symbolTable)+(Double)op2.execute(symbolTable));
		else
			return (Object)((Double)op1.execute(symbolTable)-(Double)op2.execute(symbolTable));
	}
}
