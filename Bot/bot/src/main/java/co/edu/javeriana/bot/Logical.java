package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Logical implements ASTNode {

	public Logical(ASTNode op1, ASTNode op2, int type) {
		super();
		this.op1 = op1;
		this.op2 = op2;
		this.type = type;//ANDORNOT
	}

	ASTNode op1;
	ASTNode op2;
	int type;
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		if(type==0){
			return ((Boolean)(op1.execute(symbolTable)) &&(Boolean)(op2.execute(symbolTable)));
		}
		if(type==1){
			return ((Boolean)(op1.execute(symbolTable)) ||(Boolean)(op2.execute(symbolTable)));
		}
		if(type==2){
			return !((Boolean)(op1.execute(symbolTable)));
		}
		return null;
	}

}
