%{ 

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INNER_SIZE 10
#define OUTER_SIZE 100

struct NUM{
    char valor[INNER_SIZE];
};

struct NUM numeros[OUTER_SIZE];
unsigned int numbers = 0;

%} 

%% 

[0-9]+ {printf("%s(INTEIRO)", yytext); strcpy(numeros[numbers].valor, yytext); numbers++;}
[+-]?([0-9]*[.])?[0-9]+ {printf("%s(NUMERO PONTO FLUTUANTE)", yytext); strcpy(numeros[numbers].valor, yytext); numbers++;}

FOR {printf("PARA");}
TO {printf("ATE");}
IF {printf("SE");}
As {printf("COMO");}
THEN {printf("SE NAO");}
NEXT {printf("INCREMENTO");}
LET {printf("VARIAVEL SEM TIPO");}
DEF {printf("FUNCAO");}
BEGIN {printf("INICIO");}
GOTO {printf("VA PARA");}
PRINT {printf("IMPRIME");}
INPUT {printf("LE");}
END {printf("FIM");}
= {printf("E IGUAL A");}
(:=) {printf("RECEBE");}
\> {printf("MAIOR QUE");}
\< {printf("MENOR QUE");}
\* {printf("VEZES");}
\+ {printf("SOMA");}
\- {printf("MENOS");}
\/ {printf("DIVIDE");}
"[A-Z0-9]" {printf("(STRING)");}

%% 

int yywrap(){} 

int main(void)
{ 
    FILE *fp; 
   
    fp = fopen("sample.txt", "r"); 
        
    if(fp != NULL)
    {
            yyin = fp; 

            yylex(); 

            puts("INTEGER and FLOAT/DOUBLE TOKENS:");
            for(int i = 0; i < numbers; i++)
                printf("NUM: %s\n", numeros[i].valor);
    }

    return 0; 
} 
