include 3dVarBio/compiler.inc

EXEC = create_var_list.xx
VARLIST= DAvars.txt

$(EXEC) : bin outfiles
	cd bin; $(LD) -c ../3dVarBio/da_params.f90 ../src/create_var_list.f90; $(LD) -o $(EXEC) da_params.o create_var_list.o; cd ../outfiles; ../bin/$(EXEC)

bin :
	mkdir -p bin

outfiles :
	mkdir -p outfiles

