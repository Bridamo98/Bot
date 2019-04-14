package co.edu.javeriana.bot;

import java.util.List;
import java.util.Map;

public class Function implements ASTNode {

	public Function(List<ASTNode> body, String name) {
		super();
		this.body = body;
		this.name = name;
	}

	List<ASTNode> body;
	String name;
	
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		
		//TODO:Aqui se inicializa un mapa nuevo
		//TODO:Se pone el mapa nuevo en una NUEVA cola; la cola nueva tiene que tener los mismos elementos de la cola anterior + el mapa nuevo
		
		
		for(ASTNode n: body){
			n.execute(symbolTable);//TODO:Se tiene que pasar como parametro la cola NUEVA (como siempre)
		}
		return null;
	}

}
