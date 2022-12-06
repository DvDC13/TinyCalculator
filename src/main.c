#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yyparse(void);
extern void yyerror(const char *s);
extern FILE *yyin;

/* main function */
int main(int argc, char **argv)
{
    if (argc > 2) {
        fprintf(stderr, "usage: %s [file]\n", argv[0]);
        exit(1);
    }
    else if (argc == 2)
    {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            fprintf(stderr, "error: couldn't open file %s\n", argv[1]);
            exit(1);
        }
    }
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