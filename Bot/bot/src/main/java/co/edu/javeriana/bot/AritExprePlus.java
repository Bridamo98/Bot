package co.edu.javeriana.bot;

import java.util.Map;

public class AritExprePlus implements ASTNode {

	ASTNode op1;
	ASTNode op2;
	Boolean op;
	
	public AritExprePlus(ASTNode op1, ASTNode op2, Boolean op) {
		super();
		this.op1 = op1;
		this.op2 = op2;
		this.op = op;
	}

	@Override
	public Object execute(Map<String, Object> symbolTable) {
		// TODO Auto-generated method stub
		return null;
	}
}
