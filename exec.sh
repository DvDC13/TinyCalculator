bison -d parser.y
flex lexer.l
cc -o calculator parser.tab.c lex.yy.c
rm -rf parser.tab.c lex.yy.c parser.tab.h