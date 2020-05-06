#Name: Intelligent Fine-grained Intrusion Detection System
#Version: 0.1.0
#Synopsis: A library about Intelligent Fine-grained Intrusion Detection System.
#Authors: Bo Lu <bolu@bupt.edu.cn>
#License: LGPL with OCaml linking exception

PF     = firewall_extracted
MAIN   = twsfw
#all:
#	$(SETUP) -all $(ALLFLAGS)

$(PF)_$(MAIN) : $(PF)_obj.o $(MAIN).o 
	gcc -o $(PF)_$(MAIN)  -L"`ocamlc -where`" $(MAIN).o $(PF)_obj.o	\
	-lm -ldl -lasmrun -lunix

$(MAIN).o : $(MAIN).c 
	cc -c $(MAIN).c -I"`ocamlc -where`"

$(PF)_obj.o:$(PF).ml
	ocamlopt -output-obj unix.cmxa $(PF).ml -o $(PF)_obj.o 

clean:
	rm -f $(PF)_obj.o $(PF).o $(MAIN).o $(PF).cmi $(PF).cmx $(PF)_$(MAIN) 

