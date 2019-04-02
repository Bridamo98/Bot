package co.edu.javeriana.bot;

import java.util.Map;

public class BooleanManager implements ASTNode {
	Object value;
	BooleanManager (Object valor)
	{
		super();
		this.value=valor;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		return value;
	}

}
