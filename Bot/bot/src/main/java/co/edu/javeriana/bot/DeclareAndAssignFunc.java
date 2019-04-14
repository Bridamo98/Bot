package co.edu.javeriana.bot;

import java.util.Map;

public class DeclareAndAssignFunc implements ASTNode {

	public DeclareAndAssignFunc(String name, ASTNode value) {
		super();
		this.name = name;
		this.value = value;
	}
	String name;
	ASTNode value;
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		symbolTable.put(name, value);//TODO: poner variable en el primer elemento de la cola (el ultimo que entro)
		return null;
	}

}
