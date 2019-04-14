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
		//TODO: diferenciar variables normales de las llamadas a funciones, porque las funciones se manejan con parametros
		return symbolTable.get(name);//TODO: recorrer todos los mapas de la cola en orden hasta que se encuentre la variable name
	}

}
