# Makefile --

TARGETS		= shared-library.so program.exe

include ../rules.make

## --------------------------------------------------------------------

alpha.o: alpha.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

alpha.import.scm: alpha.o

alpha.import.so: alpha.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

beta.o: beta.scm alpha.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

beta.import.scm: beta.o

beta.import.so: beta.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

delta.o: delta.scm alpha.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

delta.import.scm: delta.o

delta.import.so: delta.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

gamma.o: gamma.scm beta.import.so delta.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

gamma.import.scm: gamma.o

gamma.import.so: gamma.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

shared-library.so: alpha.o beta.o gamma.o delta.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

main.o: main.scm shared-library.so alpha.import.so beta.import.so delta.import.so gamma.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
