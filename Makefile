CC=cc

all: src/lexer.l src/parser.y src/main.c
	bison -d src/parser.y
	flex src/lexer.l
	$(CC) -o TinyCalculator src/main.c lex.yy.c parser.tab.c

clean:
	rm -f *.o lex.yy.c parser.tab.c parser.tab.h TinyCalculator