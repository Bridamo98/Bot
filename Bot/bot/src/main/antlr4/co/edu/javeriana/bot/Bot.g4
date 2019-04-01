grammar Bot;
/*
@header {

import org.jpavlich.bot.*;

}

@parser::members {

private Bot bot;

public BotParser(TokenStream input, Bot bot) {
    this(input);
    this.bot = bot;
}

}
program
:
	//(up{bot.up(up().value);}|down{bot.down(down().value);}|left{bot.left(left().value);}|right{bot.right(right().value);})+
	(up{System.out.println(up().value);})//|down{System.out.println(down().value);}|left{System.out.println(left().value);}|right{System.out.println(right().value);})+
	//create_var|assignation|if_statement|while_statement|def_function|call_function|read_statement|write_statement)*

;
up returns [int value]
:
	UP
	INTEGER{$value=Integer.parseInt($INTEGER().getText());}
	SEMICOLON
;
down returns [Integer value]
:
	DOWN
	INTEGER{$value=Integer.parseInt($INTEGER().getText());}
	SEMICOLON
;
left returns [Integer value]
:
	LEFT
	INTEGER{$value=Integer.parseInt($INTEGER().getText());}
	SEMICOLON
;
right returns [Integer value]
:
	RIGHT
	INTEGER{$value=Integer.parseInt($INTEGER().getText());}
	SEMICOLON
;
create_var
:
	LET ID SEMICOLON | (LET ID EQUAL (arit_expre_plus | STRING) SEMICOLON)
;

arit_expre_plus
:
	arit_expre_mult(PLUS arit_expre_mult)*|arit_expre_mult(MINUS arit_expre_mult)*
;
operator
:
	(MINUS)?
;


arit_expre_mult 
:
	term((MULT|DIV) term)*
;
term
:
	INTEGER|FLOAT	
;
assingnation 
:

;


def_function//GRAMATICA LIBRE DE CONTEXTO, ANÁLISIS SINTACTICO
:
	FUNCTION ID PAR_O f_arguments PAR_C BRACKET_O
	sentence*
	BRACKET_C SEMICOLON 
;
f_arguments
:
	ID (COMMA ID)* 
;

sentence
:
	INTEGER SEMICOLON
;
 
start
:
	'hello' 'world' 
;

// Los tokens se escriben a continuación de estos comentarios.
// Todo lo que esté en líneas previas a lo modificaremos cuando hayamos visto Análisis Sintáctico
UP: 'up';
DOWN: 'down';
LEFT: 'left';
RIGHT: 'right';
PICK: 'pick';
DROP: 'drop';
LOOK: 'look';

LET: 'let';
IF: 'if';
WHILE: 'while';
READ: 'read';
WRITELN: 'writeln';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
AND: 'and';
OR: 'or';
NOT: 'not';
GT: '>';
LT: '<';
LOET: '<=';
GOET: '>=';
COMP: '==';
DIFF: '<>';
FUNCTION: 'function';
BEGIN: 'begin';
END: 'end';
DOT: '.';
COMMA: ',';
EQUAL: '=';
SEMICOLON: ';';
//COMENT: '/''/';
PAR_O: '(';
PAR_C: ')';
BRACKET_O: '{';
BRACKET_C: '}';
SBRACKET_O: '[';
SBRACKET_C: ']';

ID: (''|('a'..'z')|('A'..'Z'))(''|('a'..'z')|('A'..'Z')|('0'..'9'))*;



FLOAT: ('0'..'9')+'.'('0'..'9')+;
BOOL: 'true'|'false';
STRING: '"'.*?'"';
INTEGER: ('0'..'9')+;






WS
:
	[ \t\r\n]+ -> skip
;*/
@header {

import org.jpavlich.bot.*;
import java.util.HashMap;
import java.util.Map;
}

@parser::members {

private Bot bot;

public BotParser(TokenStream input, Bot bot) {
    this(input);
    this.bot = bot;
}

}

program:
{
	List<ASTNode> body =new ArrayList<ASTNode>();
	Map<String,Object> symbolTable = new HashMap<String, Object>();		
} 
(statement{body.add($statement.node);})*
{
	for(ASTNode n: body){
		n.execute(symbolTable);
	}
}
;

statement returns [ASTNode node]: t1=command{$node=$t1.node;}|t2=create_var{$node=$t2.node;}|assign|writeln{$node=$writeln.node;};
//$arit_expre_plus.value
writeln  returns[ASTNode node]
:
	WRITELN (arit_expre_plus{$node=new Writeln($arit_expre_plus.node);}) SEMICOLON//QUEREMOS IMPRIMIR VARIABLES--------------------
	//{System.out.println($arit_expre_plus.node);}
;
assign returns [ASTNode node]//noooo
:
	ID EQUAL expression{$node=$expression.node} SEMICOLON
;
create_var returns [ASTNode node] //tampocoooo
:
	LET ID{$node=new CreateVar($ID.text);} SEMICOLON
;
expression returns [ASTNode node]
:
	(arit_expre_plus){$node=$arit_expre_plus.node;}
;
arit_expre_plus returns[ASTNode node]
:
	t1=arit_expre_mult{$node =$t1.node;}
	((PLUS t2=arit_expre_mult{$node =new AritExprePlus($node,$t2.node);}|MINUS arit_expre_mult) )*
;

arit_expre_mult returns [ASTNode node] 
:
	t1=term{$node=$t1.node;}((MULT t2=term{$node=new AritExpreMult($node,$t2.node,true);}|DIV t3=term{$node=new AritExpreMult($node,$t3.node,false);}))*
;

term returns [ASTNode node]
:

	(MINUS t1=INTEGER{$node=new Term(-1.0*Double.parseDouble($t1.text),false);System.out.println($t1.text);}|
		t2=INTEGER{$node=new Term(Double.parseDouble($t2.text),false);System.out.println($t2.text);}|
		MINUS t3=FLOAT{$node=new Term(-1.0*Double.parseDouble($t3.text),false);System.out.println($t3.text);}|
		t4=FLOAT{$node=new Term(Double.parseDouble($t4.text),false);System.out.println($t4.text);})|
		PAR_O arit_expre_plus {$node=new Term($arit_expre_plus.node,true);}PAR_C
		
;

//---------------------------------
command returns [ASTNode node]: (t1=up{$node=$t1.node;} |t2=down{$node=$t2.node;}|t3=left{$node=$t3.node;}|t4=right{$node=$t4.node;});

up returns [ASTNode node]: UP  number
	{
		{$node=new Up($number.node,bot);}	
	}
	SEMICOLON;
down returns [ASTNode node]: DOWN number
	{	
		{$node=new Down($number.node,bot);}	
	}
	SEMICOLON;
left returns [ASTNode node]:LEFT number
	{
		{$node=new Left($number.node,bot);}	
	}
	SEMICOLON;
right returns [ASTNode node]: RIGHT number
	{
		{$node=new Right($number.node,bot);}	
	}
	SEMICOLON;

number returns [ASTNode node]:
	t1=INTEGER {$node=new Number(Integer.parseInt($t1.text));};




// Los tokens se escriben a continuación de estos comentarios.
// Todo lo que esté en líneas previas a lo modificaremos cuando hayamos visto Análisis Sintáctico
UP: 'up';
DOWN: 'down';
LEFT: 'left';
RIGHT: 'right';
PICK: 'pick';
DROP: 'drop';
LOOK: 'look';

LET: 'let';
IF: 'if';
WHILE: 'while';
READ: 'read';
WRITELN: 'writeln';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
AND: 'and';
OR: 'or';
NOT: 'not';
GT: '>';
LT: '<';
LOET: '<=';
GOET: '>=';
COMP: '==';
DIFF: '<>';
FUNCTION: 'function';
BEGIN: 'begin';
END: 'end';
DOT: '.';
COMMA: ',';
EQUAL: '=';
SEMICOLON: ';';
//COMENT: '/''/';
PAR_O: '(';
PAR_C: ')';
BRACKET_O: '{';
BRACKET_C: '}';
SBRACKET_O: '[';
SBRACKET_C: ']';

ID: ('_'|[a-z]|[A-Z])('_'|[a-z]|[A-Z]|[0-9])*;



FLOAT: [0-9]+'.'([0-9])+;
BOOL: 'true'|'false';
STRING: '"'.*?'"';
INTEGER: [0-9]+;

WS
:
	[ \t\r\n]+ -> skip
;