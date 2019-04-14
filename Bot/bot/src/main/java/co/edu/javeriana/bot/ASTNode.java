package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public interface ASTNode {
	
	public Object execute( Stack <Map<String,Object>> symbolTable);//TODO: pasar cola de mapas a todas las funciones
}
