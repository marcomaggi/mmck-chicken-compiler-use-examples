# Makefile --

TARGETS		= program.exe

include ../rules.make

## --------------------------------------------------------------------

expand-time-library.o: expand-time-library.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

expand-time-library.import.scm: expand-time-library.o

expand-time-library.import.so: expand-time-library.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

expand-time-library.so: expand-time-library.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

run-time-library.o: run-time-library.scm expand-time-library.so expand-time-library.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

run-time-library.import.scm: run-time-library.o

run-time-library.import.so: run-time-library.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

run-time-library.so: run-time-library.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

main.o: main.scm run-time-library.so run-time-library.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program.exe: main.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

### end of file
