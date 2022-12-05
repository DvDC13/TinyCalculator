%{
    #include <stdio.h>
    #include <stdlib.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV
%token LPAREN RPAREN
%token EOL

%%

calclist: /* nothing */
    | calclist exp EOL { printf("= %d\n", $2); }
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { if ($3 == 0) { yyerror("Can not divide by zero"); exit(1); } else $$ = $1 / $3; }
    ;

term: NUMBER
    | LPAREN exp RPAREN { $$ = $2; }
    ;

%%

int main(int argc, char **argv)
{
    yyparse();
}

void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}