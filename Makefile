all: sierpinsky
sierpinsky : sierpinsky.ml
	ocamlc -o test mips.ml mips_helper.ml sierpinsky.ml
	./test
clean:
	rm -f *.out *.cmo *.cmi test
