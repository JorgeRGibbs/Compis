#mfcalc Makefile
run : mfcalc
	./mfcalc
clean :
	rm *.o *.c mfcalc mfcalc.tab.h
lex.yy.c : mfcalc.l mfcalc.tab.c
	flex mfcalc.l
mfcalc.tab.c : mfcalc.y
	bison -d mfcalc.y
lex.yy.o : lex.yy.c
	gcc -c lex.yy.c
mfcalc.tab.o : mfcalc.tab.c
	gcc -c mfcalc.tab.c
mfcalc : lex.yy.o mfcalc.tab.o
	gcc mfcalc.tab.o lex.yy.o -ll -lm -o mfcalc



#bison -d mfcalc.y
#flex mfcalc.l
#gcc -c lex.yy.c 
#gcc -c mfcalc.tab.c
#gcc mfcalc.tab.o lex.yy.o -ll -lm
#./a.out 