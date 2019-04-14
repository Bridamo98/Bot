package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Number implements ASTNode {

	

	Object value;
	public Number(Object value) {
		super();
		this.value = value;
	}
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		// TODO Auto-generated method stub
		return value;
	}

}
