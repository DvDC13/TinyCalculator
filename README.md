# TinyCalculator

TinyCalculator is a scientific calculator using Bison & Flex.

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

## Example

## Compile and Run

- bison -d src/parser.y
- flex src/lexer.l
- cc -o TinyCalculator src/main.c lex.yy.c parser.tab.c
- ./TinyCalculator.exe
