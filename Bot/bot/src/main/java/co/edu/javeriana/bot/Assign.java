package co.edu.javeriana.bot;

import java.util.Map;

public class Assign implements ASTNode {
	
	ASTNode value;
	String name;
	public Assign(ASTNode valor, String nombre) {
		super();
		this.value = valor;
		this.name = nombre;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		symbolTable.put(name,value.execute(symbolTable));
		return null;
	}

}
