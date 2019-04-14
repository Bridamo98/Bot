package co.edu.javeriana.bot;

import java.util.Map;

public class CallFunction implements ASTNode {

	String name;
	public CallFunction(String name) {
		super();
		this.name = name;
	}
	
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		// TODO Auto-generated method stub
		ASTNode aux=(ASTNode)(symbolTable.get(name));
		aux.execute(symbolTable);
		return null;
	}

}
