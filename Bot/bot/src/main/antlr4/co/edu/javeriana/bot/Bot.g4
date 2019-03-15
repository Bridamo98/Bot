grammar Bot;

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


 
start
:
	'hello' 'world' 
;

// Los tokens se escriben a continuación de estos comentarios.
// Todo lo que esté en líneas previas a lo modificaremos cuando hayamos visto Análisis Sintáctico



WS
:
	[ \t\r\n]+ -> skip
;