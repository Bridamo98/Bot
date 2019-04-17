package co.edu.javeriana.bot;

import java.util.Map;
import java.util.Stack;

import org.jpavlich.bot.Bot;

public class PICK implements ASTNode {
	public PICK(Bot bot) {
		super();
		this.bot = bot;
	}
	Bot bot;
	@Override
	public Object execute(Stack<Map<String, Object>> symbolTable) {
		// TODO Auto-generated method stub
		
		return bot.pick();
	}

}
