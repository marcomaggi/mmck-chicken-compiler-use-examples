# Makefile --

TARGETS		= program.exe

include ../rules.make

## --------------------------------------------------------------------

expand-time.o: expand-time.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

expand-time.import.scm: expand-time.o

expand-time.import.so: expand-time.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

expand-time-library.so: expand-time.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

run-time.o: run-time.scm expand-time-library.so expand-time.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

run-time.import.scm: run-time.o

run-time.import.so: run-time.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

run-time-library.so: run-time.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

main.o: main.scm run-time-library.so run-time.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
