%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <math.h>

    #include "parser.tab.h"

    int yylex();
    void yyerror(const char *s);

    extern FILE *yyin;
%}

%start calculator

%union {
    double number;
};

/* declare tokens */
%token <number> NUMBER
%token ADD SUB MUL DIV ABS
%token LPAREN RPAREN
%token EOL

%type <number> calculator exp term factor realnum

%%

calculator: { $$ = 0; }
    | calculator exp EOL { printf("The result is %.2f\n", $2); }
    ;

exp: factor { $$ = $1; }
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term { $$ = $1; }
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { if ($3 == 0) { yyerror("Can not divide by zero"); exit(1); } else $$ = $1 / $3; }
    ;

term: realnum { $$ = $1; }
    | ABS exp ABS { $$ = abs($2); }
    | LPAREN exp RPAREN { $$ = $2; }
    ;

realnum: NUMBER { $$ = $1; }
    | SUB realnum %prec UMINUS { $$ = -$2; }
    ;

%%