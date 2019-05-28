%{
#include<stdlib.h>
#include "rpcalc.tab.h"
%}


%%
[0-9]+"."?[0-9]* {	yylval= atof(yytext); printf("Acabo de wachar un numero we\n"); return NUM;}
\n {/*printf("Wacho un enter");*/ return '\n';}
[ ]   {/*printf("Veo un espacio");*/ }
[-n+*/^] {return * yytext;}
%%
