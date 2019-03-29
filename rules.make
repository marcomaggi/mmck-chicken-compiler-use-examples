# rules.make --
#
# This file is included in all the makefiles.


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


#### common flags

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


#### common variables and rules

CLEANFILES		= $(TARGETS) *.so *import.* *.o *.c
CLEANFILES_NO_PROGS	= *.so *import.* *.o *.c

RM			= rm --force --verbose --recursive
MV			= mv --verbose
MKDIR_P			= mkdir -p

## --------------------------------------------------------------------

.PHONY: all check clean clean-more clean-no-progs

all: $(TARGETS)

clean: clean-more
	@$(RM) $(CLEANFILES)

check:
	@for file in ./*.exe ; do $$file ; done

clean-no-progs:
	@$(RM) $(CLEANFILES_NO_PROGS)

clean-more:

### end of file
