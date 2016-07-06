#Makefile
# Created on: Jul 2, 2016
#     Author: andadroid452
#     Vers. :  0.01

#yes we want 3 passes of optimisation...  
opt_lvl=-O3
vpath %.f03 lib
mod_folder=lib/
modules=catch.f03

.PHONY: all clean

FORTRAN_COMPILER = gfortran

all: 
	
	$(FORTRAN_COMPILER) $(opt_lvl) -g \
		-o bin/MATRIX.exe \
		lib/catch.f03 src/MATRIX.f03
		
clean:
	rm -f bin/HELLO.exe *.mod
