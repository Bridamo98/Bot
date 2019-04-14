package co.edu.javeriana.bot;

import java.util.Map;

public class CreateVar implements ASTNode {

	private String name;
	
	
	public CreateVar(String name) {
		super();
		this.name = name;
	}


	@Override
	public Object execute(Map<String, Object> symbolTable) {
		symbolTable.put(name, new Object());//TODO: poner variable en el primer elemento de la cola (el ultimo que entro)
		return null;
	}

}
