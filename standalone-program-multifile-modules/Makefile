# Makefile --

TARGETS		= program.exe

include ../rules.make

## --------------------------------------------------------------------

alpha.o: alpha.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

alpha.import.scm: alpha.o

alpha.import.so: alpha.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

beta.o: beta.scm alpha.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

beta.import.scm: beta.o

beta.import.so: beta.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

delta.o: delta.scm alpha.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

delta.import.scm: delta.o

delta.import.so: delta.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

gamma.o: gamma.scm beta.import.so delta.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

gamma.import.scm: gamma.o

gamma.import.so: gamma.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

main.o: main.scm gamma.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

## --------------------------------------------------------------------

program.exe: main.o alpha.o beta.o delta.o gamma.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
