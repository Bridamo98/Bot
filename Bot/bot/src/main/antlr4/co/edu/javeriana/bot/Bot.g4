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

}

@parser::members {

private Bot bot;

public BotParser(TokenStream input, Bot bot) {
    this(input);
    this.bot = bot;
}

}

program: statement*;

statement: command;

command: up|down|left|right;

up: UP  number
	{
		bot.up($number.valor);	
	}
	SEMICOLON;
down: DOWN number
	{
		bot.down($number.valor);	
	}
	SEMICOLON;
left: LEFT number
	{
		bot.left($number.valor);	
	}
	SEMICOLON;
right: RIGHT number
	{
		bot.right($number.valor);	
	}
	SEMICOLON;

number returns [int valor]:
	INTEGER {$valor = Integer.parseInt($INTEGER.text);};




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



FLOAT: ['0'..'9']+'.'[0-9]+;
BOOL: 'true'|'false';
STRING: '"'.*?'"';
INTEGER: [0-9]+;

WS
:
	[ \t\r\n]+ -> skip
;