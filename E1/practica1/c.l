D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%{
#include <stdio.h>
%}
%%

"/*" { printf("<span class=\"coment\"> %s </span>", yytext); }

"auto" { printf("<span class=\"auto\"> %s </span>", yytext); }
"break" { printf("<span class=\"break\"> %s </span>", yytext); }
"case" { printf("<span class=\"case\"> %s </span>", yytext); }
"char" { printf("<span class=\"char\"> %s </span>", yytext); }
"const" { printf("<span class=\"const\"> %s </span>", yytext); }
"continue" { printf("<span class=\"continue\"> %s </span>", yytext); }
"default" { printf("<span class=\"default\"> %s </span>", yytext); }
"do" { printf("<span class=\"do\"> %s </span>", yytext); }
"double" { printf("<span class=\"double\"> %s </span>", yytext); }
"else" { printf("<span class=\"else\"> %s </span>", yytext); }
"enum" { printf("<span class=\"enum\"> %s </span>", yytext); }
"extern" { printf("<span class=\"extern\"> %s </span>", yytext); }
"float" { printf("<span class=\"float\"> %s </span>", yytext); }
"for" { printf("<span class=\"for\"> %s </span>", yytext); }
"goto" { printf("<span class=\"got\"> %s </span>", yytext); }
"if" { printf("<span class=\"if\"> %s </span>", yytext); }
"int" { printf("<span class=\"int\"> %s </span>", yytext); }
"long" { printf("<span class=\"long\"> %s </span>", yytext); }
"register" { printf("<span class=\"register\"> %s </span>", yytext); }
"return" { printf("<span class=\"return\"> %s </span>", yytext); }
"short" { printf("<span class=\"short\"> %s </span>", yytext); }
"signed" { printf("<span class=\"signed\"> %s </span>", yytext); }
"sizeof" { printf("<span class=\"sizeof\"> %s </span>", yytext); }
"static" { printf("<span class=\"static\"> %s </span>", yytext); }
"struct" { printf("<span class=\"struct\"> %s </span>", yytext); }
"switch" { printf("<span class=\"switch\"> %s </span>", yytext); }
"typedef" { printf("<span class=\"typedef\"> %s </span>", yytext); }
"union" { printf("<span class=\"union\"> %s </span>", yytext); }
"unsigned" { printf("<span class=\"unsigned\"> %s </span>", yytext); }
"void" { printf("<span class=\"void\"> %s </span>", yytext); }
"volatile" { printf("<span class=\"volatile\"> %s </span>", yytext); }
"while" { printf("<span class=\"while\"> %s </span>", yytext); }

{L}({L}|{D})*	{ printf("<span class=\"ids\"> %s </span>", yytext); }

0[xX]{H}+{IS}? {printf("<span class=\"hex\"> %s </span>", yytext);}
0{D}+{IS}? {printf("<span class=\"oct\"> %s </span>", yytext);}
{D}+{IS}? {printf("<span class=\"dec\"> %s </span>", yytext);}
L?'(\\.|[^\\'])+' { printf("<span class=\"constant\"> %s </span>", yytext); }

{D}+{E}{FS}? { printf("<span class=\"constant\"> %s </span>", yytext); }
{D}*"."{D}+({E})?{FS}? { printf("<span class=\"constant\"> %s </span>", yytext); }
{D}+"."{D}*({E})?{FS}? { printf("<span class=\"constant\"> %s </span>", yytext); }

L?\"(\\.|[^\\"])*\" { printf("<span class=\"stringliteral\"> %s </span>", yytext); }

"..." { printf("<span class=\"ops\"> %s </span>", yytext); }
">>=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"<<=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"+=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"-=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"*=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"/=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"%=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"&=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"^=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"|=" { printf("<span class=\"ops\"> %s </span>", yytext); }
">>" { printf("<span class=\"ops\"> %s </span>", yytext); }
"<<" { printf("<span class=\"ops\"> %s </span>", yytext); }
"++" { printf("<span class=\"ops\"> %s </span>", yytext); }
"--" { printf("<span class=\"ops\"> %s </span>", yytext); }
"->" { printf("<span class=\"flecha\"> %s </span>", yytext); }
"&&" { printf("<span class=\"ops\"> %s </span>", yytext); }
"||" { printf("<span class=\"ops\"> %s </span>", yytext); }
"<=" { printf("<span class=\"ops\"> %s </span>", yytext); }
">=" { printf("<span class=\"ops\"> %s </span>", yytext); }
"==" { printf("<span class=\"ops\"> %s </span>", yytext); }
"!=" { printf("<span class=\"ops\"> %s </span>", yytext); }
";" { printf("<span class=\"ops\"> %s </span>", yytext); }

("{") { printf("<span class=\"brackets\"> %s </span>", yytext); }
("}") { printf("<span class=\"brackets\"> %s </span>", yytext); }

","  { printf("<span class=\"typicalsymbols\"> %s </span>", yytext); }
":"  { printf("<span class=\"typicalsymbols\"> %s </span>", yytext); }
"="  { printf("<span class=\"typicalsymbols\"> %s </span>", yytext); }
"(" { printf("<span class=\"typicalsymbols\"> %s </span>", yytext); }
")"  { printf("<span class=\"typicalsymbols\"> %s </span>", yytext); }

("[") { printf("<span class=\"brackets\"> %s </span>", yytext); }
("]") { printf("<span class=\"brackets\"> %s </span>", yytext); }

"." { printf("<span class=\"bitw\"> %s </span>", yytext); }
"&" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"!" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"~" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"-" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"+" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"*" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"/" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"%" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"<" { printf("<span class=\"bitw\"> %s </span>", yytext); }
">" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"^" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"|" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"?" { printf("<span class=\"bitw\"> %s </span>", yytext); }
"#" { printf("<span class=\"constant\"> %s </span>", yytext); }
[ \t\v\f] 
[\n] { printf("<br>"); }
.

%%

int main(void){
  char stylesheet[20]="styles.css";
  printf("<!DOCTYPE html>\n<html>\n<head>\n<title>theme</title>\n<link rel=\"stylesheet\" href=\"%s\">\n</head>\n<body>", stylesheet);
  yylex();
  printf("\n</body>\n</html>");
  return 0;
}