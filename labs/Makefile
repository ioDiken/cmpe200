
lab: lab.o
	gcc -o $@ $+

lab.o: lab.s
	as -o $@ $<

clean:
	rm -vf lab *.o