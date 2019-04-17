package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Chain implements ASTNode {

	public Chain(String content) {
		super();
		this.content = content;
	}

	String content;

	@Override
	public Object execute(Stack<Map<String, Object>> symbolTable) {
		// TODO Auto-generated method stub
		return content.trim().substring(1, content.length()-1);
	
	}
	

}
