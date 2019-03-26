package co.edu.javeriana.bot;

import org.jpavlich.bot.Bot;

public class Left implements ASTNode {
	
	
	ASTNode number;
	Bot bot;
	public Left(ASTNode number, Bot bot) {
		super();
		this.number = number;
		this.bot = bot;
	}
	
	@Override
	public Object execute() {
		((Bot)bot).left((int)number.execute());
		return null;
	}

}

