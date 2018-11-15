%{
    #include <stdio.h>
    #include "ZJS.tab.h"
    #include <stdlib.h>
%}
 
%option yylineno

%%
 

[0-9]+         					{yylval.Val = atoi(yytext);  return DIGIT;}
[S-s][E-e][T-t][_][C-c][O-o][L-l][O-o][R-r]	{ return SET_COLOR;}
[R-r][E-e][C-c][T-t][A-a][N-n][G-g][L-l][E-e]	{ return RECTANGLE;}
[P-p][O-o][I-i][N-n][T-t]			{ return POINT;}
[C-c][I-i][R-r][C-c][L-l][E-e]			{ return CIRCLE;}
[L-l][I-i][N-n][E-e]				{ return LINE;}
[E-e][N-n][D-d]					{ return END;} 
[ |\t|\n]					; //ignore these chars!
;						{ return EOL;}
.						{ printf("ERROR: invalid input on line %d (%s)\n", yylineno,yytext);}

%%
