package co.edu.javeriana.bot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

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
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		
		
		Map<String,Object> symbolTabl = new HashMap<String, Object>();//Aqui se inicializa un mapa nuevo
		symbolTable.add(symbolTabl);//Se pone el mapa nuevo en una NUEVA cola; la cola nueva tiene que tener los mismos elementos de la cola anterior + el mapa nuevo
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
		symbolTable.pop();
		return null;
	
	}


}
