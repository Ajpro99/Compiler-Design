#!/bin/bash

rm -f y.tab.c y.tab.h lex.yy.c a.out

lex semantic.l

yacc -v -d semantic.y --warning=none
gcc y.tab.c --no-warnings


./a.out<input.txt

