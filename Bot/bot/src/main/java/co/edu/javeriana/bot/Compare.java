package co.edu.javeriana.bot;

import java.util.Map;

public class Compare implements ASTNode {

	int type;//<:0..>:1...<=:2...>=:3...==:4...<>:5
	ASTNode op1;
	ASTNode op2;
	
	public Compare(int type, ASTNode op1, ASTNode op2) {
		super();
		this.type = type;
		this.op1 = op1;
		this.op2 = op2;
	}
	
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		
		if(type==0){
			return (Object)((Double)(op1.execute(symbolTable))<(Double)(op2.execute(symbolTable)));
		}if(type==1){
			return (Object)((Double)(op1.execute(symbolTable))>(Double)(op2.execute(symbolTable)));
		}if(type==2){
			return (Object)((Double)(op1.execute(symbolTable))<=(Double)(op2.execute(symbolTable)));
		}if(type==3){
			return (Object)((Double)(op1.execute(symbolTable))>=(Double)(op2.execute(symbolTable)));
		}if(type==4){
			return (Object)(((Double)(op1.execute(symbolTable))).equals((Double)(op2.execute(symbolTable))));
		}if(type==5){
			return (Object)(!((Double)(op1.execute(symbolTable))).equals((Double)(op2.execute(symbolTable))));
		}
		
		return null;
	}

}
