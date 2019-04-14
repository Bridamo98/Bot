package co.edu.javeriana.bot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class WhileStatement implements ASTNode {

	public WhileStatement(ASTNode condition, List<ASTNode> body) {
		super();
		this.condition = condition;
		this.body = body;
	}

	ASTNode condition;
	List<ASTNode> body;
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		// TODO Auto-generated method stub
		Map<String,Object> symbolTabl = new HashMap<String, Object>();//Aqui se inicializa un mapa nuevo
		symbolTable.add(symbolTabl);//Se pone el mapa nuevo en una NUEVA cola; la cola nueva tiene que tener los mismos elementos de la cola anterior + el mapa nuevo
		while((boolean)(condition.execute(symbolTable))){
			for(ASTNode n: body){
				n.execute(symbolTable);
			}
		}
		symbolTable.pop();
		return null;
	}

}
