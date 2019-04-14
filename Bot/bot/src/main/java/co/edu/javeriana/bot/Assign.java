package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

public class Assign implements ASTNode {
	
	ASTNode value;
	String name;
	public Assign(ASTNode valor, String nombre) {
		super();
		this.value = valor;
		this.name = nombre;
	}
	@Override
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		Map<String,Object> mapa=Utilidades.buscarMapaDondeSeUbicaElemento(name, symbolTable);
		mapa.put(name,value.execute(symbolTable));

		return null;
	}

}
