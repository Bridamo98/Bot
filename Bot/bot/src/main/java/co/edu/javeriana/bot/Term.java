package co.edu.javeriana.bot;

import java.util.Map;

public class Term implements ASTNode {

	Object value;
	public Term(Object value) {
		super();
		this.value = value;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		// TODO Auto-generated method stub
		return value;
	}
	
	

}
