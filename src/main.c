#include <stdio.h>
#include <stdlib.h>

extern int yyparse(void);
extern void yyerror(const char *s);
extern FILE *yyin;

/* main function */
int main(int argc, char **argv)
{
    if (argc > 1)
        yyin = fopen(argv[1],"rt");
    else
        yyin = stdin;
    printf("-> ");
    yyparse();
    return 0;
}

/* error function */
void yyerror(const char *s)
{
    fprintf(stderr, "error: %s\n", s);
}