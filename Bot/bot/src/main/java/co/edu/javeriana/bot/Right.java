package co.edu.javeriana.bot;

import org.jpavlich.bot.Bot;

public class Right implements ASTNode {
	
	
	ASTNode number;
	Bot bot;
	public Right(ASTNode number, Bot bot) {
		super();
		this.number = number;
		this.bot = bot;
	}
	
	@Override
	public Object execute() {
		((Bot)bot).right((int)number.execute());
		return null;
	}

}

