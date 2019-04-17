package co.edu.javeriana.bot;

import java.util.List;
import java.util.Map;
import java.util.Stack;

public class Writeln implements ASTNode {

	

	List<ASTNode> body;
	public Writeln(List<ASTNode> body) {
		super();
		this.body = body;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		String result="";
		for(ASTNode node:body){
			result=result.concat(node.execute(symbolTable).toString());
		}
		System.out.println(result);
		return null;
	}

}
