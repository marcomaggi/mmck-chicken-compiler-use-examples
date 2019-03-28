# Makefile --

TARGETS		= program.exe

include ../rules.make

## --------------------------------------------------------------------

alpha.o: alpha.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

beta.o: beta.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

delta.o: delta.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

gamma.o: gamma.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

main.o: main.scm
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o alpha.o beta.o delta.o gamma.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
