cmake_minimum_required( VERSION 3.0 FATAL_ERROR )
set( CMAKE_VERBOSE_MAKEFILE ON )

project( BasicApp )

get_filename_component( CINDER_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../../../../.." ABSOLUTE )
get_filename_component( BLOCK_XTION_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../../../src" ABSOLUTE )
get_filename_component( APP_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../../" ABSOLUTE )

include( "${CINDER_PATH}/proj/cmake/modules/cinderMakeApp.cmake" )

find_package( Boost REQUIRED
        COMPONENTS system thread )

set( CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/modules" )
find_package( OpenNI REQUIRED )


ci_make_app(
        SOURCES     ${APP_PATH}/src/BasicApp.cpp ${BLOCK_XTION_PATH}/CinderXtion.cpp
        LIBRARIES   ${OpenNI_LIBRARIES} ${Boost_LIBRARIES}
        INCLUDES    ${Boost_INCLUDE_DIRS} ${OpenNI_INCLUDE_DIRS} ${BLOCK_XTION_PATH}
        CINDER_PATH ${CINDER_PATH}
)
