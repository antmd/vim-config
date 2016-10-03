cmake_minimum_required( VERSION 3.2 )

project(<+call:fnamemodify(bufname('%'),':p:h:t')+> VERSION 0.1.0)

# ------
# SOURCE
# ------

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(INCLUDE_FILES
    )

set(SOURCE_FILES
    )

# ----------
# EXECUTABLE
# ----------

add_executable(<+call:fnamemodify(bufname('%'),':p:h:t')+> ${SOURCE_FILES} ${INCLUDE_FILES})

set_target_properties(
    ${PROJECT_NAME}
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED ON
    )

# -------
# INSTALL
# -------

set(CMAKE_INSTALL_PREFIX ${CMAKE_CURRENT_SOURCE_DIR}/installed)
install (
    TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
    )

