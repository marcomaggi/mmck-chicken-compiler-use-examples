# Makefile --


#### general compiler options
#
# Option "-setup-mode":
#
#   When locating  extension, search the current  directory first.  By
#   default, extensions are located first in the extension repository,
#   where  chicken-install   stores  compiled  extensions   and  their
#   associated metadata.
#
# Option "-dynamic":
#
#   This option  should be  used when compiling  files intended  to be
#   loaded dynamically into a running Scheme program.
#
# Option "-library":
#
#   Compile multiple units into a dynamic library.
#
# Option  "-verbose":
#
#   Show compiler notes and tool-invocations.
#

# Included   in   every   compiler   command   line.    The   variable
# "CHICKEN_FLAGS" is available  for the user to be set  on the command
# line of "make":
#
#   $ make CHICKEN_FLAGS=...
#
AM_CHICKEN_FLAGS	= -setup-mode $(CHICKEN_FLAGS)

# Include this conditional with:
#
#   $ make VERBOSE=yes ...
#
ifdef VERBOSE
AM_CHICKEN_FLAGS	+= -verbose
endif

# Include this conditional with:
#
#   $ make VERY_VERBOSE=yes ...
#
ifdef VERY_VERBOSE
AM_CHICKEN_FLAGS	+= -vv
endif

# Include this conditional with:
#
#   $ make SUPER_VERBOSE=yes ...
#
ifdef SUPER_VERBOSE
AM_CHICKEN_FLAGS	+= -vvv
endif


#### compiler flags

# Included in every compiler command line used to compile object files
# for a shared library.
#
AM_CHICKEN_FLAGS_OBJECT_SHARED = -dynamic $(AM_CHICKEN_FLAGS)

# Included in every compiler command line used to compile object files
# for a program.
#
AM_CHICKEN_FLAGS_OBJECT_STATIC	= $(AM_CHICKEN_FLAGS)

## --------------------------------------------------------------------

# Option "-C  -g": hand "-g" option  to the C compiler.   Include this
# conditional with:
#
#   $ make DEBUG=yes ...
#
ifdef DEBUG
AM_CHICKEN_FLAGS_OBJECT_SHARED	+= -debug-info -C -g
AM_CHICKEN_FLAGS_OBJECT_STATIC	+= -debug-info -C -g
endif

# Option  "-k": keep  intermediate  files.   Include this  conditional
# with:
#
#   $ make KEEP=yes ...
#
ifdef KEEP
AM_CHICKEN_FLAGS_OBJECT_SHARED	+= -k
AM_CHICKEN_FLAGS_OBJECT_STATIC	+= -k
endif

## --------------------------------------------------------------------

# Included in every compiler command line used to link object files in
# a shared library.  The  variable "CHICKEN_LIBFLAGS" is available for
# the user to be set on the command line of "make":
#
#   $ make CHICKEN_LIBFLAGS=...
#
AM_CHICKEN_LIBFLAGS	= -library $(AM_CHICKEN_FLAGS) $(CHICKEN_LIBFLAGS)

# Included in every compiler command line used to link object files in
# a program.   The variable  "CHICKEN_PROGFLAGS" is available  for the
# user to be set on the command line of "make":
#
#   $ make CHICKEN_PROGFLAGS=...
#
AM_CHICKEN_PROGFLAGS	= $(AM_CHICKEN_FLAGS) $(CHICKEN_PROGFLAGS)


#### compiler command lines

CSC			= csc

# Compile an object file to be used in a shared library.
#
CSC_COMPILE_OBJECT_SHARED	= $(CSC) $(AM_CHICKEN_FLAGS_OBJECT_SHARED) -c -o

# Compile an object file to be used in a program.
#
CSC_COMPILE_OBJECT_STATIC	= $(CSC) $(AM_CHICKEN_FLAGS_OBJECT_STATIC) -c -o

# Compile object files into a shared  library.  We use this for import
# libraries.
#
CSC_COMPILE_LIBRARY	= $(CSC) -dynamic $(AM_CHICKEN_LIBFLAGS) -o

# Link object files into a shared library.
#
CSC_LINK_LIBRARY	= $(CSC) $(AM_CHICKEN_LIBFLAGS) -o

# Link object files into a program.
#
CSC_LINK_PROGRAM	= $(CSC) $(AM_CHICKEN_PROGFLAGS) -o


#### build targets

TARGETS		= \
	library-for-expand.so		\
	module-for-expand.import.so	\
	library-alpha.so		\
	library-beta.so			\
	program-using-alpha.exe		\
	program-using-beta.exe

CLEANFILES	= $(TARGETS) *.so *import.* *.o *.c

## --------------------------------------------------------------------

.PHONY: all clean more

all: $(TARGETS)

more: $(MORE_TARGETS)

clean:
	@rm -f $(CLEANFILES)


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
