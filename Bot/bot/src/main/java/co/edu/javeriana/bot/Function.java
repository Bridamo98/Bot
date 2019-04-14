package co.edu.javeriana.bot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class Function implements ASTNode {

	public Function(List<ASTNode> body, String name) {
		super();
		this.body = body;
		this.name = name;
	}

	List<ASTNode> body;
	String name;
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
	
		for(ASTNode n: body){
			n.execute(symbolTable);//TODO:Se tiene que pasar como parametro la cola NUEVA (como siempre)
		}
		symbolTable.pop();
		return null;
	}

}
