%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>



double regs[26];  /* Variablelar için array */ 


/* Fonksiyon declarations */
void yyerror(const char *s);   /* Standart hata mesajı */
int yylex (void);   /* Lexerdan tokenleri alır. */

%}


%union {
    double dval; /* ondalık değerlere dval ile erişim */
    int index; /* variables için lazım */
}


/* Tokenlerin alınması */
%token <dval> NUMBER 
%token PLUS
%token MINUS
%token DIVIDE
%token POWER
%token LPAREN
%token RPAREN
%token NEWLINE
%token TIMES
%token <index> VARIABLE
%token ASGN



/* Presedence tanımlamaları */
%left PLUS MINUS
%left TIMES DIVIDE
%right POWER
%nonassoc UMINUS 


%type <dval> expr  /* type tanımlaması */

%%

input : 
      | input line 
      ;

line : NEWLINE 
     | expr NEWLINE {
         printf("Sonuç = %.3f \n", $1); 
         }
     | VARIABLE ASGN expr NEWLINE { 
         regs[$1] = $3; 
         printf("%c = %.3f\n", $1 + 'a', $3); 
       }
     | error NEWLINE { yyerrok; }
     ;

expr : NUMBER { $$ = $1; }
     | VARIABLE { 
         $$ = regs[$1]; 
       }
     | expr PLUS expr { $$ = $1 + $3; }
     | expr MINUS expr { $$ = $1 - $3; }
     | expr TIMES expr { $$ = $1 * $3; }
     | expr DIVIDE expr {
        if ($3 == 0) {
            yyerror("Sıfıra bölme isteği geçersiz.");
            $$ = 0;
        } else {
            $$ = $1 / $3;
        }
     }
     | expr POWER expr { $$ = pow($1, $3); }
     | LPAREN expr RPAREN { $$ = $2; }
     | MINUS expr %prec UMINUS { $$ = -$2; }
     ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata bulundu: %s\n", s); /* Declare edilen fonksiyonun tanımlanması */
}

int main(void) {
    printf("Hesap makinesi başlatıldı. (ETU Bil 395 - Homework 1).\n"); /*Parser başlangıç mesajı */
    return yyparse();
}