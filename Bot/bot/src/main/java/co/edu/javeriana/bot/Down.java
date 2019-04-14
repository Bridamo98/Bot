package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

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
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		((Bot)bot).down((int)number.execute(symbolTable));
		return null;
	}

}
