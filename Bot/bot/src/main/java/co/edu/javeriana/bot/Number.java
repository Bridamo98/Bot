package co.edu.javeriana.bot;

public class Number implements ASTNode {

	

	Object value;
	public Number(Object value) {
		super();
		this.value = value;
	}
	@Override
	public Object execute() {
		// TODO Auto-generated method stub
		return value;
	}

}
