# Makefile --

TARGETS		= shared-library.so program.exe

include ../rules.make

## --------------------------------------------------------------------

alpha.o: alpha.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

beta.o: beta.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

gamma.o: gamma.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

delta.o: delta.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

shared-library.so: alpha.o beta.o gamma.o delta.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

main.o: main.scm shared-library.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
