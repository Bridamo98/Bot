package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

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
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		
		return ((Bot)bot).up((int)number.execute(symbolTable));
	}

}
