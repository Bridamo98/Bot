package co.edu.javeriana.bot;

import java.util.List;
import java.util.Map;

public class Conditional implements ASTNode {

	public Conditional(List<ASTNode> ifBody, List<ASTNode> elseBody, ASTNode condition, boolean type) {
		super();
		this.ifBody = ifBody;
		this.elseBody = elseBody;
		this.condition = condition;
		this.type=type;
	}

	List<ASTNode> ifBody;
	List<ASTNode> elseBody;
	ASTNode condition;
	boolean type;
	
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		if(type){
			if((boolean)(condition.execute(symbolTable))){
				for(ASTNode n: ifBody){
					n.execute(symbolTable);
				}
			}else{
				for(ASTNode n: elseBody){
					n.execute(symbolTable);
				}
			}
		}else{
			if((boolean)(condition.execute(symbolTable))){
				for(ASTNode n: ifBody){
					n.execute(symbolTable);
				}
			}
		}	
		return null;
	}

}
