package co.edu.javeriana.bot;

import org.jpavlich.bot.Bot;

public class Up implements ASTNode {
	
	
	ASTNode number;
	Bot bot;
	public Up(ASTNode number, Bot bot) {
		super();
		this.number = number;
		this.bot = bot;
	}
	
	@Override
	public Object execute() {
		((Bot)bot).up((int)number.execute());
		return null;
	}

}
