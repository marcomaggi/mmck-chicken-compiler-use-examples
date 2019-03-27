# Makefile --

TARGETS		= \
	library-for-expand.so		\
	module-for-expand.import.so	\
	library-alpha.so		\
	library-beta.so			\
	program-using-alpha.exe		\
	program-using-beta.exe

include ../rules.make


#### rules for: library-for-expand

module-for-expand.o: module-for-expand.scm
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

library-for-expand.so: module-for-expand.o
	$(CSC_LINK_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

module-for-expand.import.scm: module-for-expand.o

module-for-expand.import.so: module-for-expand.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo


#### rules for: library-alpha

module-alpha.o: module-alpha.scm library-for-expand.so module-for-expand.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

library-alpha.so: module-alpha.o
	$(CSC_LINK_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

module-alpha.import.scm: module-alpha.o

module-alpha.import.so: module-alpha.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo


#### rules for: program using alpha

program-using-alpha-module-main.o: program-using-alpha-module-main.scm library-alpha.so module-alpha.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program-using-alpha.exe: program-using-alpha-module-main.o library-alpha.so
	$(CSC_LINK_PROGRAM) $(@) $(<)
	@echo


#### rules for: library-beta

LIBRARY_BETA_OBJECTS_DEPS	= library-alpha.so module-alpha.import.so

module-beta-one.o: module-beta-one.scm $(LIBRARY_BETA_OBJECTS_DEPS)
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

module-beta-two.o: module-beta-two.scm $(LIBRARY_BETA_OBJECTS_DEPS) module-beta-one.import.so
	$(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	@echo

library-beta.so: module-beta-one.o module-beta-two.o
	$(CSC_LINK_LIBRARY) $(@) $(^)
	@echo

## --------------------------------------------------------------------

module-beta-one.import.scm: module-beta-one.o

module-beta-one.import.so: module-beta-one.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

module-beta-two.import.scm: module-beta-two.o

module-beta-two.import.so: module-beta-two.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo


#### rules for: program using beta

PROGRAM_BETA_OBJECTS_DEPS	= library-beta.so module-beta-one.import.so module-beta-two.import.so

program-using-beta-module-one.o: program-using-beta-module-one.scm $(PROGRAM_BETA_OBJECTS_DEPS)
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program-using-beta-module-main.o: program-using-beta-module-main.scm $(PROGRAM_BETA_OBJECTS_DEPS) program-using-beta-module-one.import.so
	$(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

program-using-beta.exe: program-using-beta-module-main.o program-using-beta-module-one.o
	$(CSC_LINK_PROGRAM) $(@) $(^)
	@echo

## --------------------------------------------------------------------

program-using-beta-module-one.import.scm: program-using-beta-module-one.o

program-using-beta-module-one.import.so: program-using-beta-module-one.import.scm
	$(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

### end of file
