run : rpcalc
	./rpcalc
clean :
	rm *.o *.c *.h rpcalc
lex.yy.c : rpcalc.l rpcalc.tab.c
	flex rpcalc.l
rpcalc.tab.c : rpcalc.y
	bison -d rpcalc.y
lex.yy.o : lex.yy.c
	gcc -c lex.yy.c
rpcalc.tab.o : rpcalc.tab.c
	gcc -c rpcalc.tab.c
rpcalc : lex.yy.o rpcalc.tab.o
	gcc rpcalc.tab.o lex.yy.o -ll -lm -o rpcalc

