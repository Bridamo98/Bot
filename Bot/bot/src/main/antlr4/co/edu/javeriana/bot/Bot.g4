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
import java.util.Stack;
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
	Map<String,Object> symbolTabl = new HashMap<String, Object>();		
	Stack < Map <String,Object> > symbolTable= new Stack  < Map<String,Object> >();
	symbolTable.add(symbolTabl);
	//TODO: cola de mapas
} 
(statement{body.add($statement.node);})*
{
	for(ASTNode n: body){
		try{
			n.execute(symbolTable);	
		}catch(Exception e){
			System.out.println("Execution error");
		}
		
	}
}
;

statement returns [ASTNode node]
: 
		(t1=command{$node=$t1.node;}|t2=create_var{$node=$t2.node;}|t3=assign{$node=$t3.node;}|
		t4=writeln{$node=$t4.node;}|t5=conditional{$node=$t5.node;}|t6=whileStatement{$node=$t6.node;}|
		t7=decFunction{$node=$t7.node;}|t8=declareAndAssing{$node=$t8.node;}|
		t9=callFunction{$node=$t9.node;}|t10=read{$node=$t10.node;})SEMICOLON
;
read returns [ASTNode node]
:
	READ ID{$node=new Read($ID.text);}
;
callFunction returns[ASTNode node]
:
	{
		ArrayList<ASTNode> parameters=new ArrayList<ASTNode>();
	}
	((ID PAR_O PAR_C )
	|(ID PAR_O (expression{parameters.add($expression.node);}|t1=expression{parameters.add($t1.node);}(COMMA t2=expression{parameters.add($t2.node);})+) PAR_C ))
	{$node=new CallFunction($ID.text,parameters);}
;
declareAndAssing returns [ASTNode node]
:
	LET ID EQUAL expression{$node=new DeclareAndAssing($ID.text,$expression.node);} 
	//|LET t2=ID EQUAL command {$node=new DeclareAndAssing($t2.text,$command.node);}
;
decFunction returns [ASTNode node]
:
	{
		List<ASTNode> body=new ArrayList<ASTNode>();
		ArrayList<String> parameters=new ArrayList<String>();
		
	}
	FUNCTION ID 
	(	
		(PAR_O PAR_C)|
		(PAR_O ((LET t0=ID){parameters.add($t0.text);}|
		(LET t1=ID){parameters.add($t1.text);}(COMMA (LET t2=ID)+{parameters.add($t2.text);})+
	) PAR_C))
	BEGIN
		(statement{body.add($statement.node);})*
	END
	{
		$node=new DeclareAndAssignFunc($ID.text,new Function(body,$ID.text,parameters));
		
	}
;
arguments returns[ASTNode node]//despuesito
:
	
;
//$arit_expre_plus.value
writeln  returns[ASTNode node]
:	
	{
		List<ASTNode> body=new ArrayList<ASTNode>();
	}
	//WRITELN (arit_expre_plus{$node=new Writeln($arit_expre_plus.node);}) //QUEREMOS IMPRIMIR VARIABLES--------------------
	//WRITELN (expression{$node=new Writeln($expression.node);})
	//|WRITELN (ID{$node=new Writeln(new Id($ID.text));} )
	//|WRITELN logical{$node=new Writeln($logical.node);} 
	//|WRITELN command {$node=new Writeln($command.node);}
	WRITELN
	(PAR_O arit_expre_plus{body.add($arit_expre_plus.node);} PAR_C | PAR_O logical{body.add($logical.node);}PAR_C|
		string{body.add($string.node);}|ID{body.add(new Id($ID.text));})
	(PLUS(PAR_O arit_expre_plus{body.add($arit_expre_plus.node);} PAR_C | PAR_O logical{body.add($logical.node);}PAR_C|
		string{body.add($string.node);}|ID{body.add(new Id($ID.text));}))*
	{
		$node=new Writeln(body);
	}
		
	//{System.out.println($arit_expre_plus.node);}
	// 
;
bool returns [ASTNode node]
:
	BOOL {$node=new BooleanManager(Boolean.parseBoolean($BOOL.text));}|
	t2= ID{$node =new Id($t2.text);}
;

assign returns [ASTNode node]
:
	t1=ID EQUAL expression{$node=new Assign($expression.node,$t1.text);} 
	//|t2= ID EQUAL command {$node=new Assign($command.node,$t2.text);}
;


create_var returns [ASTNode node]
:
	LET ID{$node=new CreateVar($ID.text);} 
;
compExpreUltimate returns [ASTNode node]
:
	t1=compExpre{$node=$t1.node;}|
	NOT (PAR_O?)t2=compExpre{$node=new Logical($t2.node,null,2);}(PAR_C?)
	|NOT (PAR_O?)t3=ID{$node=new Logical(new Id($t3.text),null,2);}(PAR_C?)
	| t4=ID{$node=new Id($t4.text);}
;
compExpre returns [ASTNode node]
:
	(
	(t10= ID)
		(
			GT(t11=ID){$node=new CompareId(1,new Id($t10.text),new Id($t11.text));}	|
			LT(t12=ID){$node=new CompareId(0,new Id($t10.text),new Id($t12.text));}|
			GOET(t13=ID){$node=new CompareId(3,new Id($t10.text),new Id($t13.text));}|
			LOET (t14=ID){$node=new CompareId(2,new Id($t10.text),new Id($t14.text));}|
			COMP (t15=ID){$node=new CompareId(4,new Id($t10.text),new Id($t15.text));}|
			DIFF (t16=ID){$node=new CompareId(5,new Id($t10.text),new Id($t16.text));}
		)
	)|
	(t0=arit_expre_plus)
		(GT(t1=arit_expre_plus){$node=new Compare(1,$t0.node,$t1.node);}|
		LT(t2=arit_expre_plus){$node=new Compare(0,$t0.node,$t2.node);}|
		GOET(t3=arit_expre_plus){$node=new Compare(3,$t0.node,$t3.node);}|
		LOET (t4=arit_expre_plus){$node=new Compare(2,$t0.node,$t4.node);}|
		COMP (t5=arit_expre_plus){$node=new Compare(4,$t0.node,$t5.node);}|
		DIFF (t6=arit_expre_plus){$node=new Compare(5,$t0.node,$t6.node);}
	)|(t7=bool{$node=$t7.node;})|(PAR_O)t8=logical{$node=$t8.node;}(PAR_C)
	|(
	(t00=string)
		(
			COMP (t05=string){$node= new CompareString(4,$t00.node,$t05.node);}|
			DIFF  (t06=string){$node= new CompareString(5,$t00.node,$t06.node);}
		)
	)
	|(
	(t000=bool)
		(
			COMP(t005=bool){$node=new CompareBool(4,$t000.node,$t005.node);}|
			DIFF (t006=bool){$node=new CompareBool(5, $t000.node, $t006.node);}
		)	
		
	)
	
;
expression returns [ASTNode node]
:
	(t1=arit_expre_plus){$node=$t1.node;}|	
	t3=logical{$node=$t3.node;}
	|t2=command {$node= $t2.node;}|
	t4=string{$node= $t4.node;}
;
string returns [ASTNode node]
:
	t1=STRING{$node=new Chain($t1.text);}|
	t2= ID{$node =new Id($t2.text);}
;
logical returns [ASTNode node]
:
	(t1=logicalSub{$node=$t1.node;})(OR t2=logicalSub{$node=new Logical($node,$t2.node,1);})*
;

logicalSub returns [ASTNode node]
:
	(t1=compExpreUltimate{$node=$t1.node;}) (AND t3=compExpreUltimate{$node=new Logical($node,$t3.node,0);})*
;
arit_expre_plus returns[ASTNode node]
:
	t1=arit_expre_mult{$node =$t1.node;}
	((PLUS t2=arit_expre_mult{$node =new AritExprePlus($node,$t2.node,true);}|MINUS t3=arit_expre_mult {$node=new AritExprePlus($node,$t3.node,false);}) )*
;

arit_expre_mult returns [ASTNode node] 
:
	t1=term{$node=$t1.node;}((MULT t2=term{$node=new AritExpreMult($node,$t2.node,true);}|DIV t3=term{$node=new AritExpreMult($node,$t3.node,false);}))*
;

term returns [ASTNode node]
:

	(ID{$node=new Id($ID.text);}|MINUS t1=INTEGER{$node=new Term(-1.0*Double.parseDouble($t1.text),false);}|
		t2=INTEGER{$node=new Term(Double.parseDouble($t2.text),false);}|
		MINUS t3=FLOAT{$node=new Term(-1.0*Double.parseDouble($t3.text),false);}|
		t4=FLOAT{$node=new Term(Double.parseDouble($t4.text),false);})|
		PAR_O arit_expre_plus {$node=new Term($arit_expre_plus.node,true);}PAR_C
		
;
conditional returns [ASTNode node]
: 
	{
		List<ASTNode> ifBody =new ArrayList<ASTNode>();
		List<ASTNode> elseBody =new ArrayList<ASTNode>();
	}
	IF PAR_O expression PAR_C
	(
		(BEGIN
			(statement{ifBody.add($statement.node);})*
		END
		ELSE
		BEGIN
			(statement{elseBody.add($statement.node);})*
		END
		{
				$node=new Conditional(ifBody,elseBody,$expression.node,true);
		}
		)	
		|//-----------------------------------------------------------
		(BEGIN
			(statement{ifBody.add($statement.node);})*
		END
		{
				$node=new Conditional(ifBody,null,$expression.node,false);
		}
		)	
	)
	
	
	
;
whileStatement returns[ASTNode node]
:
	{
		List<ASTNode> body =new ArrayList<ASTNode>();
	}
	WHILE PAR_O expression PAR_C
	BEGIN
			(statement{body.add($statement.node);})*
	END
	{
		$node=new WhileStatement($expression.node,body);
	}
;

 
	
//---------------------------------
command returns [ASTNode node]: (t1=up{$node=$t1.node;} |t2=down{$node=$t2.node;}|t3=left{$node=$t3.node;}|t4=right{$node=$t4.node;}

|t5=drop{$node=$t5.node;}|t6=look{$node=$t6.node;}|t7=pick{$node=$t7.node;}
) ;


up returns [ASTNode node]: UP  number
	{
		{$node=new Up($number.node,bot);}	
	}
	;
down returns [ASTNode node]: DOWN number
	{	
		{$node=new Down($number.node,bot);}	
	}
	;
left returns [ASTNode node]:LEFT number
	{
		{$node=new Left($number.node,bot);}	
	}
;
right returns [ASTNode node]: RIGHT number
	{
		{$node=new Right($number.node,bot);}	
	}
	;
	
	
drop returns [ASTNode node]: DROP
{
	{$node=new Drop(bot);}
}
;

pick returns [ASTNode node]:PICK 
{
	{$node=new PICK(bot);}
}
;

look returns [ASTNode node]: LOOK
{
	{$node=new Look(bot);}
}
;

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
ELSE: 'else';
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
BOOL: 'true'|'false';




FLOAT: [0-9]+'.'([0-9])+;

STRING: '"'.*?'"';
INTEGER: [0-9]+;
ID: ('_'|[a-z]|[A-Z])('_'|[a-z]|[A-Z]|[0-9])*;
WS
:
	[ \t\r\n]+ -> skip
;
