package co.edu.javeriana.bot;

import java.util.List;
import java.util.Map;
import java.util.Stack;

public class Writeln implements ASTNode {

	

	List<ASTNode> body;
	boolean line;
	public Writeln(List<ASTNode> body, boolean line) {
		super();
		this.body = body;
		this.line=line;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		String result="";
		for(ASTNode node:body){
			result=result.concat(node.execute(symbolTable).toString());
		}
		if(line){
			System.out.println(result);
		}else{
			System.out.print(result);
		}
		
		return null;
	}

}
