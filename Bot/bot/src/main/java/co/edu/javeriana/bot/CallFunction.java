package co.edu.javeriana.bot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

public class CallFunction implements ASTNode {

	String name;
	ArrayList<ASTNode> parameters;
	public CallFunction(String name, ArrayList<ASTNode> parameters) {
		super();
		this.name = name;
		this.parameters=parameters;
	}
	
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		// TODO Auto-generated method stub
		ASTNode aux=(ASTNode)(Utilidades.buscarElemento(name, symbolTable));
		
		Map<String,Object> symbolTabl = new HashMap<String, Object>();//Aqui se inicializa un mapa nuevo
		
		///Aqui se ponen los parametros
		
		//System.out.println(aux);
		ArrayList<String> auxParam=((Function)aux).getParameters();
		if(parameters.size() != auxParam.size()){
			System.out.println("La cantidad de paramatros no coincide con la cantidad definida");
			return null;
		}
		for(int i=0;i<auxParam.size();i++){
			symbolTabl.put(auxParam.get(i),parameters.get(i).execute(symbolTable));
		}
		
		Stack < Map <String,Object> > symbolTableParaLaFuncion= new Stack  < Map<String,Object> >();
		symbolTableParaLaFuncion.add(symbolTabl);
		
		aux.execute(symbolTableParaLaFuncion);
		return null;
	}

}
