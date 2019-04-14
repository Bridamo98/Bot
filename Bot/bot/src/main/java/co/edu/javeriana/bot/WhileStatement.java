package co.edu.javeriana.bot;

import java.util.List;
import java.util.Map;

public class WhileStatement implements ASTNode {

	public WhileStatement(ASTNode condition, List<ASTNode> body) {
		super();
		this.condition = condition;
		this.body = body;
	}

	ASTNode condition;
	List<ASTNode> body;
	
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		// TODO Auto-generated method stub
		while((boolean)(condition.execute(symbolTable))){
			for(ASTNode n: body){
				n.execute(symbolTable);
			}
		}
		return null;
	}

}
