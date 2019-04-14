package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Writeln implements ASTNode {

	

	ASTNode value;
	public Writeln(ASTNode value) {
		super();
		this.value = value;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		System.out.println(value.execute(symbolTable));
		return null;
	}

}
