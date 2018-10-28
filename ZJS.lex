%{
    #include <stdio.h>
    int num_lines = 0;
%}
 
%%
 

[0-9]+         					{ printf("DIGIT\n"); }
[C-c][O-o][L-l][O-o][R-r]			{ printf("SET COLOR\n");}
[R-r][E-e][C-c][T-t][A-a][N-n][G-g][L-l][E-e]	{ printf("RECTANGLE\n");}
[C-c][I-i][R-r][C-c][L-l][E-e]			{ printf("CIRCLE\n");}
[L-l][I-i][N-n][E-e]				{ printf("LINE\n");}
[E-e][N-n][D-d]					{ printf("EXIT\n");} 
[/;/]						{ printf("END_STATEMENT\n");}
[0-9]+\.[0-9]+					{ printf("FLOAT\n");}
\t+|\s+						; //ignore these chars!
\n						++num_lines;
.+						{ printf("ERROR: invalid input on line %d\n", num_lines);}

%%
 
int main(int argc, char** argv){
  yylex();    // Start lexing!
  return 0;
}
