
$(lab): $(lab).o
	gcc -o $@ $+

$(lab).o: $(lab).s
	as -mfpu=vfpv2 -o $@ $<

clean:
	rm -vf $(lab) *.o
