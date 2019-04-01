package co.edu.javeriana.bot;

import java.util.Map;

public class AritExprePlus implements ASTNode {

	ASTNode op1;
	ASTNode op2;
	
	
	public AritExprePlus(ASTNode op1, ASTNode op2) {
		super();
		this.op1 = op1;
		this.op2 = op2;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		return (Object)((Double)op1.execute(symbolTable)+(Double)op2.execute(symbolTable));
	}
}
