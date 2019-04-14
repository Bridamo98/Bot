package co.edu.javeriana.bot;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class CallFunction implements ASTNode {

	String name;
	public CallFunction(String name) {
		super();
		this.name = name;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		// TODO Auto-generated method stub
		ASTNode aux=(ASTNode)(Utilidades.buscarElemento(name, symbolTable));
		
		Map<String,Object> symbolTabl = new HashMap<String, Object>();//Aqui se inicializa un mapa nuevo
		
		///Aqui se ponen los parametros
		Stack < Map <String,Object> > symbolTableParaLaFuncion= new Stack  < Map<String,Object> >();
		symbolTableParaLaFuncion.add(symbolTabl);
		
		aux.execute(symbolTableParaLaFuncion);
		return null;
	}

}
