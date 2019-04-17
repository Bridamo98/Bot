package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Scanner;
import java.util.Stack;

public class Read implements ASTNode {

	public Read(String content) {
		super();
		this.content = content;
	}

	String content;
	
	@Override
	public Object execute(Stack<Map<String, Object>> symbolTable) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		String name = sc.nextLine(); 
		Map<String, Object> mapa =Utilidades.buscarMapaDondeSeUbicaElemento(content, symbolTable);
		mapa.put(content,name);
		return null;
	}

}
