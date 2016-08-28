cmake_minimum_required( VERSION 3.2 )

project(<+call:fnamemodify(bufname('%'),':p:h:t')+>)

set(CXX_STANDARD 11)
set(CXX_STANDARD_REQUIRED ON)
set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/installed)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(<+call:fnamemodify(bufname('%'),':p:h:t')+>_INCLUDE_FILES
    )

set(<+call:fnamemodify(bufname('%'),':p:h:t')+>_SOURCE_FILES
    )


# EXECUTABLE <+call:fnamemodify(bufname('%'),':p:h:t')+>
# ---------------
add_executable(<+call:fnamemodify(bufname('%'),':p:h:t')+> ${<+call:fnamemodify(bufname('%'),':p:h:t')+>_SOURCE_FILES} ${<+call:fnamemodify(bufname('%'),':p:h:t')+>_INCLUDE_FILES})


# INSTALL <+call:fnamemodify(bufname('%'),':p:h:t')+>
# -------
install (
    TARGETS <+call:fnamemodify(bufname('%'),':p:h:t')+>
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    )

