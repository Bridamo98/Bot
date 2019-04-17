package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

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
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		return ((Bot)bot).left((int)number.execute(symbolTable));
	}

}

