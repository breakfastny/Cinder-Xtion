# - Try to find OpenNI
#  OpenNI_FOUND - system has OpenNI
#  OpenNI_INCLUDE_DIRS - The OpenNI include directories
#  OpenNI_LIBRARIES - The libraries needed to use OpenNI
#  OpenNI_DEFINITIONS - Compiler switches required for using OpenNI


# use pkg-config to get the directories and then use these values
# in the find_path() and find_library() calls
find_package( PkgConfig )
pkg_check_modules( PC_OPENNI libopenni )

set( OpenNI_DEFINITIONS ${PC_OPENNI_CFLAGS_OTHER} )

find_path( OPENNI_INCLUDE_DIR XnOpenNI.h
	PATHS
    ${PC_OPENNI_INCLUDEDIR}/ni
    ${PC_OPENNI_INCLUDE_DIRS}
	/usr/include
    /usr/local/include
)

find_library( OPENNI_LIBRARY NAMES OpenNI
	PATHS
    ${PC_OPENNI_LIBDIR}
    ${PC_OPENNI_LIBRARY_DIRS}
)

include( FindPackageHandleStandardArgs )
# handle the QUIETLY and REQUIRED arguments and set OPENNI_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args( OpenNI DEFAULT_MSG OPENNI_LIBRARY OPENNI_INCLUDE_DIR )

mark_as_advanced( OPENNI_INCLUDE_DIR OPENNI_LIBRARY )

set( OpenNI_LIBRARIES ${OPENNI_LIBRARY} )
set( OpenNI_INCLUDE_DIRS ${OPENNI_INCLUDE_DIR} )
