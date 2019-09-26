%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER NL
%left '+' '-'
%left '*' '/'

%%
inputformat : exp NL {printf("valid expression\nResult=%d",$1); exit(0);}
;
exp:exp '+' exp {$$=$1+$3;}
   |exp '-' exp {$$=$1-$3;}
   |exp '*' exp {$$=$1*$3;}
   |exp '/' exp {$$=$1/$3;}
   |'(' exp ')' {$$=$2;}
   |NUMBER      {$$=$1;}
   ;
%%

int yyerror(char *msg)
{
 printf("Invalid expression\n");
 exit(0);
}

main()
{
 printf("enter the expression: \n");
 yyparse();
}
