package co.edu.javeriana.bot;

import java.util.Map;

public class Term implements ASTNode {

	Object value;
	Boolean termino;
	public Term(Object value, Boolean termino) {
		super();
		this.value = value;
		this.termino=termino;
	}
	@Override
	public Object execute(Map<String, Object> symbolTable) {
		if(termino){
			return ((ASTNode)value).execute(symbolTable);
		}else{
			return value;
		}
		
	}
	
	

}
