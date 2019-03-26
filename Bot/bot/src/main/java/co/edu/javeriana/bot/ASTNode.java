package co.edu.javeriana.bot;

import java.util.Map;

public interface ASTNode {
	
	public Object execute(Map<String,Object> symbolTable);
}
