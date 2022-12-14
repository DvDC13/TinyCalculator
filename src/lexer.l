/* Stop the error "undefined reference to 'yywrap'" from Flex */
%option noyywrap

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "parser.tab.h"
%}

%%
[0-9]+([.][0-9]*)?      { yylval.number = atof(yytext); return NUMBER; }
"+"                     { return ADD; }
"-"                     { return SUB; }
"*"                     { return MUL; }
"/"                     { return DIV; }
"("                     { return LPAREN; }
")"                     { return RPAREN; }
"|"                     { return ABS; }
"exit"|"EXIT"           { return EXIT; }
[\n]                    { return EOL; }
[ \t]+                  { /* ignore whitespace */ }
.                       { printf("Illegal character '%c'", yytext[0]); return 0; }
%%
