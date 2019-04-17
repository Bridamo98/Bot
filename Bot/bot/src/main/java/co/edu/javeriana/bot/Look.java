package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

import org.jpavlich.bot.Bot;

public class Look implements ASTNode {
	
	
	public Look(Bot bot) {
		super();
		this.bot = bot;
	}

	Bot bot;
	
	@Override
	public Object execute(Stack<Map<String, Object>> symbolTable) {
		
		return bot.look();
	}

}
