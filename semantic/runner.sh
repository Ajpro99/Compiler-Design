#!/bin/bash

rm -f y.tab.c y.tab.h lex.yy.c a.out

lex semantic.l

yacc -v -d semantic.y 
gcc y.tab.c 


./a.out<input.txt

