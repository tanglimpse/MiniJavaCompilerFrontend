grammar MiniJava;

goal : mainClass (classDeclaration)* ;

mainClass : 'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' Identifier ')' '{' statement '}' '}' ;

classDeclaration: 'class' Identifier ( 'extends' Identifier )? '{' ( varDeclaration )* ( methodDeclaration )* '}' ;

varDeclaration: thetype Identifier ';';

methodDeclaration: 'public' thetype Identifier '(' ( thetype Identifier ( ',' thetype Identifier )* )? ')' '{' ( varDeclaration )* ( statement )* 'return' expression ';' '}' ;

thetype: 'int' '[' ']' #INTARRAY
|   'boolean' #BOOL
|   'int' #INT
|   Identifier #ID
    ;

expression:    expression '[' expression ']' # ARRAYSEARCH
|   expression '.' 'length' # LENGTH
|   expression '.' Identifier '(' ( expression ( ',' expression )* )? ')' # FUNCTION
|   expression op=( '&&' | '<' | '+' | '-' | '*' ) expression # BIOP
|   BOOL = ('true' | 'false') # BOOLLIT
|   IntergerLiteral # INTLIT
|   Identifier # VAR
|   'this' # THIS
|   'new' 'int' '[' expression ']' # NEWINT
|   'new' Identifier '(' ')' # NEWID
|   '!' expression #NOT
|   '(' expression ')' #BRACKET
;

statement : '{' ( statement )* '}' #CURLYBRACKET
|   'if' '(' expression ')' statement 'else' statement #IFELSE
|   'while' '(' expression ')' statement #WHILE
|   'System.out.println' '(' expression ')' ';' #PRINT
|   Identifier '=' expression ';' #ASSIGN
|   Identifier '[' expression ']' '=' expression ';' #ARRAYASSIGN
    ;

WS : [ \t\r\n]+ -> skip ;
IntergerLiteral : ([1-9][0-9]*|[0]);
Identifier : [a-zA-Z_] [a-zA-Z0-9_]*;
Comment : '/*' .*? '*/' -> skip ;
LineComment : '//' ~[\r\n]* -> skip ; 