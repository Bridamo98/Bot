package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class CreateVar implements ASTNode {

	private String name;
	
	
	public CreateVar(String name) {
		super();
		this.name = name;
	}


	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		Map<String,Object> mapa= symbolTable.pop();
		mapa.put(name, new Object());//TODO: poner variable en el primer elemento de la cola (el ultimo que entro)
		symbolTable.add(mapa);
		return null;
	}

}
