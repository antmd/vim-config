cmake_minimum_required( VERSION 2.8 )

set( CMAKE_INSTALL_PREFIX /usr/local )

project(<+call:fnamemodify(bufname('%'),':p:h:t'):u+>)
include(CheckCXXCompilerFlag)

check_cxx_compiler_flag("-std=c++11" SUPPORTS_CXX11)
if( SUPPORTS_CXX11 )
    set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
else()
    check_cxx_compiler_flag("-std=c++0x" SUPPORTS_CXX0X)
    if( SUPPORTS_CXX0X )
        set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
    else()
        message("C++11 is not supported")
    endif()
endif()


set(  <+call:fnamemodify(bufname('%'),':p:h:t'):u+>_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR} )

set( CMAKE_INCLUDE_CURRENT_DIR ON )


file( GLOB_RECURSE 
    <+call:fnamemodify(bufname('%'),':p:h:t'):u+>_INCLUDE_FILES 
    ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_BASE_DIR}/*.h
    )

file( GLOB_RECURSE 
    <+call:fnamemodify(bufname('%'),':p:h:t'):u+>_SOURCE_FILES
    ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_BASE_DIR}/*.cpp
    ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_BASE_DIR}/*.mm
    )

file(
    COPY ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_INCLUDE_FILES} 
    DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/include/<+call:fnamemodify(bufname('%'),':p:h:t'):u+>
    )

include_directories( ${Boost_INCLUDE_DIR} )

set( ALL_SOURCES ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_INCLUDE_FILES} ${<+call:fnamemodify(bufname('%'),':p:h:t'):u+>_SOURCE_FILES} )

add_executable( <+call:fnamemodify(bufname('%'),':p:h:t'):u+> ${ALL_SOURCES} )

# INSTALL
# -------

install (
    TARGETS <+call:fnamemodify(bufname('%'),':p:h:t'):u+>
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    )

