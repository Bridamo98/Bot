package co.edu.javeriana.bot;

import java.util.Map;

public class Assign implements ASTNode {
	
	ASTNode value;
	String name;
	public Assign(ASTNode value, String name) {
		super();
		this.value = value;
		this.name = name;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		
		symbolTable.put(name,value.execute(symbolTable));
		return null;
	}

}
