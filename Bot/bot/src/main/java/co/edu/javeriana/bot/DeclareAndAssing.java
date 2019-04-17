package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class DeclareAndAssing implements ASTNode {

	public DeclareAndAssing(String name, ASTNode value) {
		super();
		this.name = name;
		this.value = value;
	}

	String name;
	ASTNode value;
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		Map<String,Object> mapa= symbolTable.pop();
		symbolTable.add(mapa);
		mapa.put(name, value.execute(symbolTable));//TODO: poner variable en el primer elemento de la cola (el ultimo que entro)
		
		return null;
	}

}
