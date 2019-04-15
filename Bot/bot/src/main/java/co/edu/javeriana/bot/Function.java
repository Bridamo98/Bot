package co.edu.javeriana.bot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class Function implements ASTNode {

	public Function(List<ASTNode> body, String name,  ArrayList<String> parameters) {
		super();
		this.body = body;
		this.name = name;
		this.parameters=parameters;
	}

	public ArrayList<String> getParameters() {
		return parameters;
	}

	public void setParameters(ArrayList<String> parameters) {
		this.parameters = parameters;
	}

	List<ASTNode> body;
	String name;
	ArrayList<String> parameters;
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
	
		for(ASTNode n: body){
			n.execute(symbolTable);//TODO:Se tiene que pasar como parametro la cola NUEVA (como siempre)
		}
		symbolTable.pop();
		return null;
	}

}
