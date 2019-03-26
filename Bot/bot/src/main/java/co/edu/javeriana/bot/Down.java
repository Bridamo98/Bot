package co.edu.javeriana.bot;

import org.jpavlich.bot.Bot;

public class Down implements ASTNode {

	ASTNode number;
	Bot bot;
	public Down(ASTNode number, Bot bot) {
		super();
		this.number = number;
		this.bot = bot;
	}
	@Override
	public Object execute() {
		((Bot)bot).down((int)number.execute());
		return null;
	}

}
