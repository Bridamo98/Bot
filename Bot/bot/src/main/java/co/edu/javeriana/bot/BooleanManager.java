package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class BooleanManager implements ASTNode {
	Object value;
	BooleanManager (Object valor)
	{
		super();
		this.value=valor;
	}
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		return value;
	}

}
