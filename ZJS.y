%{


	#include <stdio.h>
	int yyerror(const char *s);
	#include "zoomjoystrong.h"
%}

%union{
   int Val;
}

%token LINE
%token CIRCLE
%token <Val> DIGIT
%token POINT
%token RECTANGLE
%token SET_COLOR
%token END
%token EOL

%%

program: stmt_lst;
stmt_lst: stmt stmt_lst
	| stmt
	;

stmt: LINE DIGIT DIGIT DIGIT DIGIT EOL		{line($2,$3,$4,$5);}
    | CIRCLE DIGIT DIGIT DIGIT EOL		{circle($2, $3, $4);}
    | RECTANGLE DIGIT DIGIT DIGIT DIGIT EOL	{rectangle($2, $3, $4, $5);}
    | POINT DIGIT DIGIT EOL			{point($2, $3);} 
    | SET_COLOR DIGIT DIGIT DIGIT EOL		{set_color($2, $3, $4);}
    | END EOL					{finish();}
    ;

%%

int main(int argc, char** argv){
	setup();
	yyparse();
	return 0;
}

int yyerror(const char *s){

	printf("%s\n", s);
	return 0;
}
