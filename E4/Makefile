run: a.out
	./a.out
lex.yy.c : rpcalc.l
	flex rpcalc.l
rpcalc.tab.c : rpcalc.y
	bison -d rpcalc.y
lex.yy.o : lex.yy.c
	gcc -c lex.yy.c
rpcalc.tap.o : rpcalc.tab.c
	gcc -c rpcalc.tab.c
a.out : lex.yy.o rpcalc.tab.o
	gcc -lm -ll rpcalc.tab.o lex.yy.o

