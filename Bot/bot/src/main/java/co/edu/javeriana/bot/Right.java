package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

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
	public Object execute(Stack <Map<String,Object>> symbolTable) {
		//((Bot)bot).right((int)number.execute(symbolTable));
		return (Object)((Bot)bot).right((int)number.execute(symbolTable));
	}

}

