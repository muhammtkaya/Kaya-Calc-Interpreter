%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"   /* gerekli olan kütüphaneler */
%}

%%

 /* Tokenlerin belirlenmesi */

[a-z]           { yylval.index = *yytext - 'a'; return VARIABLE; } 
"="             { return ASGN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"**"            { return POWER; }
"^"             { return POWER; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
[ \t]           ;
\n              { return NEWLINE; }
[0-9]*\.?[0-9]+ {
    yylval.dval=atof(yytext);    /* ondalık değere çevirmece */
    return NUMBER;
}
.              { printf("Tanımsız karakter :%s \n" , yytext); }

%%


 /* EOF kontrolü */
int yywrap() { return 1; }