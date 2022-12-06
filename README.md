# TinyCalculator

TinyCalculator is a small scientific calculator using Bison & Flex.

## Functionality

- Supports Addition, Substraction, Multiplication, Division.
- Supports Absolute value.
- Can handle both Integer and Float Values.
- Can pass a file to the binary or write in stdin.

## Requirements

- Bison (Add the bin path to the environment variables PATH on windows)
- Flex (Add the bin path to the environment variables PATH on windows)
- gcc compiler
- make (If you want to use the makefile, otherwise you can use the exec.sh script)

## How to use
./TinyCalculator [file]
Warning: When using a file, do not forget to add a return to line at the end!

- 1 + 1
-> The result is 2.00
- 2 + -7
-> The result is -5.00
- 3 * ( 1.2 * 4 )
-> The result is 14.40

## Compile and Run

- bison -d src/parser.y
- flex src/lexer.l
- cc -o TinyCalculator src/main.c lex.yy.c parser.tab.c
- ./TinyCalculator.exe [file]
