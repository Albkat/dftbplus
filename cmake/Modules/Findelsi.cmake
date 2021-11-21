find_package(PkgConfig QUIET)
pkg_check_modules(ELSI QUIET elsi)
if(ELSI_FOUND)
  message(STATUS "Found 'elsi' via pkg-config")

  add_library(elsi::elsi INTERFACE IMPORTED)
  target_link_libraries(
    elsi::elsi
    INTERFACE
    "${ELSI_LINK_LIBRARIES}"
  )
  target_include_directories(
    elsi::elsi
    INTERFACE
    "${ELSI_INCLUDE_DIRS}"
  )

  # DFTB+ checks for the lowercase variable name
  set(elsi_VERSION "${ELSI_VERSION}")
endif()
