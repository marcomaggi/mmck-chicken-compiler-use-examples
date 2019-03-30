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

shared-library.o: shared-library.scm alpha.import.so beta.import.so delta.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

shared-library.import.scm: shared-library.o

shared-library.import.so: shared-library.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

shared-library.so: alpha.o beta.o delta.o shared-library.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

main.o: main.scm shared-library.so shared-library.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
