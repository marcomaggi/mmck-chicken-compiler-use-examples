# Makefile --

THE_ENV		= CHICKEN_REPOSITORY_PATH=$(PWD)/build:$(CHICKEN_REPOSITORY_PATH); export CHICKEN_REPOSITORY_PATH;
BUILD_DEPS	= build/.dirstamp
TARGETS		= build/shared-library.so build/program.exe

include ../rules.make

clean-more:
	$(RM) build

build/.dirstamp:
	@$(MKDIR_P) build
	@: > build/.dirstamp

## --------------------------------------------------------------------

build/alpha.o: lib/alpha.scm $(BUILD_DEPS)
	$(THE_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	$(MV) alpha.import.scm build/
	@echo

build/alpha.import.scm: build/alpha.o

build/alpha.import.so: build/alpha.import.scm
	$(THE_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

build/beta.o: lib/beta.scm build/alpha.import.so $(BUILD_DEPS)
	$(THE_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	$(MV) beta.import.scm build/
	@echo

build/beta.import.scm: build/beta.o

build/beta.import.so: build/beta.import.scm
	$(THE_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

build/delta.o: lib/delta.scm build/alpha.import.so $(BUILD_DEPS)
	$(THE_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	$(MV) delta.import.scm build/
	@echo

build/delta.import.scm: build/delta.o

build/delta.import.so: build/delta.import.scm
	$(THE_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

build/shared-library.o: lib/shared-library.scm build/beta.import.so build/delta.import.so $(BUILD_DEPS)
	$(THE_ENV) $(CSC_COMPILE_OBJECT_SHARED) $(@) $(<)
	$(MV) shared-library.import.scm build/
	@echo

build/shared-library.import.scm: build/shared-library.o

build/shared-library.import.so: build/shared-library.import.scm
	$(THE_ENV) $(CSC_COMPILE_LIBRARY) $(@) $(<)
	@echo

## --------------------------------------------------------------------

LIBRARY_OBJECTS	= build/alpha.o build/beta.o build/delta.o build/shared-library.o
LIBRARY_DEPS	= $(LIBRARY_OBJECTS) $(BUILD_DEPS)

build/shared-library.so: $(LIBRARY_DEPS)
	$(THE_ENV) $(CSC_LINK_LIBRARY) $(@) $(LIBRARY_OBJECTS)
	@echo

## --------------------------------------------------------------------

PROGRAM_IMPORT_LIB_DEPS	= build/alpha.import.so build/beta.import.so build/delta.import.so build/shared-library.import.so
PROGRAM_DEPS		= build/shared-library.so $(PROGRAM_IMPORT_LIB_DEPS) $(BUILD_DEPS)

build/main.o: prog/main.scm $(PROGRAM_DEPS)
	$(THE_ENV) $(CSC_COMPILE_OBJECT_STATIC) $(@) $(<)
	@echo

build/program.exe: build/main.o
	$(THE_ENV) $(CSC_LINK_PROGRAM) $(@) $(<)
	@echo

### end of file
