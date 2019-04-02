package co.edu.javeriana.bot;

import java.util.Map;

public class Id implements ASTNode {

	

	String name;
	public Id(String name) {
		super();
		this.name = name;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		
		return symbolTable.get(name);
	}

}
