package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class CompareBool implements ASTNode {

	int type;//<:0..>:1...<=:2...>=:3...==:4...<>:5
	ASTNode op1;
	ASTNode op2;
	
	public CompareBool(int type, ASTNode op1, ASTNode op2) {
		super();
		this.type = type;
		this.op1 = op1;
		this.op2 = op2;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		if(type==4){
			return (Object)(((Boolean)(op1.execute(symbolTable))).equals((Boolean)(op2.execute(symbolTable))));
		}if(type==5){
			return (Object)(!((Boolean)(op1.execute(symbolTable))).equals((Boolean)(op2.execute(symbolTable))));
		}
		
		return null;
	}


}
