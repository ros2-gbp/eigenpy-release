# Copyright (C) 2008-2022 LAAS-CNRS, JRL AIST-CNRS, INRIA.
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.

# ------ # README # ------ #

# .rst: .. ifmode:: user
#
# This section lists the variables and macros that must be defined and invoked
# in the right place to enable the features of this cmake modules.
#
# For a minimal working example see :ref:`minimal-working-example`.
#
# Required variables
# ------------------
#
# .. variable:: PROJECT_NAME
#
# Please keep respect our coding style and choose a name which respects the
# following regexp: ``[a-z][a-z0-9-]*`` I.e. a lower-case letter then one or
# more lower-case letter, number or hyphen ``-``.
#
# .. variable:: PROJECT_URL
#
# Project's website.
#
# .. variable:: PROJECT_DESCRIPTION
#
# One line summary of the package goal.
#
# Optional variables
# ------------------
#
# .. variable:: PROJECT_VERSION
#
# Project version (X.Y.Z where X, Y, Z are unsigned integers). If not defined,
# it will automatically be computed through `git describe`. See
# :cmake:command:`VERSION_COMPUTE` for more information.
#
# .. variable:: PROJECT_DEBUG_POSTFIX
#
# If set, ``${PROJECT_DEBUG_POSTFIX}`` will be appended to the libraries
# generated by the project (as the builtin `CMAKE_DEBUG_POSTFIX
# <https://cmake.org/cmake/help/v3.0/variable/CMAKE_DEBUG_POSTFIX.html>`_) but
# this will also trigger the generation of an appropriate debug pkg-config file.
#
# .. variable:: PROJECT_USE_KEYWORD_LINK_LIBRARIES
#
# If set to true, the jrl-cmakemodules will use the PUBLIC keyword in
# ``target_link_libraries``. Defaults to false.
#
# .. variable: PROJECT_CUSTOM_HEADER_DIR
#
# Allows to define a custom directory for the installation of C/C++ header
# files. The default value is derived from ``${PROJECT_NAME}`` where non
# alpha-numeric characters are replaced with a ``/``, creating a folder
# hierarchy.
#
# .. variable: PROJECT_CUSTOM_HEADER_EXTENSION
#
# Allows to define a custom extension for C/C++ header files (e.g. .h, .hh,
# .hpp). The default value is set to .hh.
#
# .. variable: PROJECT_GENERATED_HEADERS_SKIP_DEPRECATED
#
# If true, does not generate the
# ``deprecated.${PROJECT_CUSTOM_HEADER_EXTENSION}`` file. Defaults to false
#
# .. variable: PROJECT_GENERATED_HEADERS_SKIP_CONFIG
#
# If true, does not generate the ``config.${PROJECT_CUSTOM_HEADER_EXTENSION}``
# file. Defaults to false
#
# .. variable: PROJECT_GENERATED_HEADERS_SKIP_WARNING
#
# If true, does not generate the ``warning.${PROJECT_CUSTOM_HEADER_EXTENSION}``
# file. Defaults to false
#
# .. variable:: PROJECT_USE_CMAKE_EXPORT
#
# This tells jrl-cmakemodules that you are using export functionalities so it
# will hook the installation of your configuration files. Defaults to false
#
# .. variable:: PROJECT_EXPORT_NO_TARGET
#
# This tells jrl-cmakemodules that there is no targets in the project. However
# the export functionalities are still provided to detect the project
# properties. Not setting this variable when no target is present will result in
# an error.
#
# .. variable:: PROJECT_JRL_CMAKE_MODULE_DIR
#
# This variable provides the full path pointing to the JRL cmake module.
#
# .. variable:: PROJECT_JRL_CMAKE_BINARY_DIR
#
# This variable provides the full path pointing to the JRL cmake binary dir.
#
# .. variable:: PROJECT_COMPATIBILITY_VERSION
#
# If set, this variable defines COMPATIBILITY version of the project
# (AnyNewerVersion|SameMajorVersion|SameMinorVersion|ExactVersion). The default
# value is SameMajorVersion. See
# https://cmake.org/cmake/help/latest/module/CMakePackageConfigHelpers.html#generating-a-package-version-file
# for further details.
#
# .. variable:: PROJECT_AUTO_RUN_FINALIZE
#
# If set, to true or unset SETUP_PROJECT_FINALIZE run automatically at the end
# of the root CMakeLists.txt. If set to false, SETUP_PROJECT_FINALIZE must be
# called manually. This is helpful when creating a CMake workspace where the
# root CMakelists.txt don't belong to a project.
#
# .. variable:: PROJECT_PACKAGES_IN_WORKSPACE
#
# List of packages in the workspace. This must be defined in the root
# CMakeLists. These packages will not be searched with find_package and all
# target and variables defined in the module should be defined in a workspace
# projects.
#
# .. variable:: PROJECT_PYTHON_PACKAGES_IN_WORKSPACE
#
# List of paths to Python package in the workspace. This must be defined in the
# root CMakeLists.txt. Python package should be generated in a workspace
# projects.
#
# Macros
# ------
#

if(CMAKE_MINIMUM_REQUIRED_VERSION VERSION_LESS 3.10)
  message(
    FATAL_ERROR
      "JRL-CMakemodules require CMake >= 3.10. Please update your main 'cmake_minimum_required'"
  )
endif()

set(PROJECT_JRL_CMAKE_MODULE_DIR
    ${CMAKE_CURRENT_LIST_DIR}
    CACHE INTERNAL "")

set(PROJECT_JRL_CMAKE_BINARY_DIR
    ${CMAKE_CURRENT_BINARY_DIR}
    CACHE INTERNAL "")

if(NOT DEFINED PROJECT_AUTO_RUN_FINALIZE)
  set(PROJECT_AUTO_RUN_FINALIZE TRUE)
endif()

# Please note that functions starting with an underscore are internal functions
# and should not be used directly.

# Include base features.
include(${CMAKE_CURRENT_LIST_DIR}/logging.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/portability.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/compiler.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/debian.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/dist.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/distcheck.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/doxygen.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/header.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/uninstall.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/install-data.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/release.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/version.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/package-config.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/version-script.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/test.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/oscheck.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/cxx-standard.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/coverage.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/modernize-links.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/relpath.cmake)

# --------- # Constants # --------- #

# Variables requires by SETUP_PROJECT.
set(REQUIRED_VARIABLES PROJECT_NAME PROJECT_DESCRIPTION PROJECT_URL)

# Check that required variables are defined.
foreach(VARIABLE ${REQUIRED_VARIABLES})
  if(NOT DEFINED ${VARIABLE})
    message(
      AUTHOR_WARNING
        "Required variable ``${VARIABLE}'' has not been defined, perhaps you are including cmake/base.cmake too early"
    )
    message(
      AUTHOR_WARNING
        "Check out https://jrl-cmakemodules.readthedocs.io/en/master/pages/base.html#minimal-working-example for an example"
    )
    message(
      FATAL_ERROR "Required variable ``${VARIABLE}'' has not been defined.")
  endif(NOT DEFINED ${VARIABLE})
endforeach(VARIABLE)

message(STATUS "Configuring \"${PROJECT_NAME}\" (${PROJECT_URL})")

# If the project version number is not set, compute it automatically.
if(NOT DEFINED PROJECT_VERSION)
  version_compute()
else()
  if(NOT DEFINED PROJECT_VERSION_MAJOR
     AND NOT DEFINED PROJECT_VERSION_MINOR
     AND NOT DEFINED PROJECT_VERSION_PATCH)
    split_version_number(${PROJECT_VERSION} PROJECT_VERSION_MAJOR
                         PROJECT_VERSION_MINOR PROJECT_VERSION_PATCH)
  endif()
endif()
set(SAVED_PROJECT_VERSION "${PROJECT_VERSION}")
set(SAVED_PROJECT_VERSION_MAJOR "${PROJECT_VERSION_MAJOR}")
set(SAVED_PROJECT_VERSION_MINOR "${PROJECT_VERSION_MINOR}")
set(SAVED_PROJECT_VERSION_PATCH "${PROJECT_VERSION_PATCH}")

if(PROJECT_VERSION MATCHES UNKNOWN)
  set(PROJECT_VERSION_FULL "")
else(PROJECT_VERSION MATCHES UNKNOWN)
  if(PROJECT_VERSION_PATCH)
    set(PROJECT_VERSION_FULL
        "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}"
    )
  else(PROJECT_VERSION_PATCH)
    set(PROJECT_VERSION_FULL
        "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}")
  endif(PROJECT_VERSION_PATCH)
endif(PROJECT_VERSION MATCHES UNKNOWN)

# Set a script to run after project called
set(CMAKE_PROJECT_${PROJECT_NAME}_INCLUDE
    "${CMAKE_CURRENT_LIST_DIR}/post-project.cmake")

# Set a hook to finalize the setup, CMake will set CMAKE_CURRENT_LIST_DIR to ""
# at the end Based off
# https://stackoverflow.com/questions/15760580/execute-command-or-macro-in-cmake-as-the-last-step-before-the-configure-step-f
if(PROJECT_AUTO_RUN_FINALIZE)
  variable_watch(CMAKE_CURRENT_LIST_DIR SETUP_PROJECT_FINALIZE_HOOK)
  function(SETUP_PROJECT_FINALIZE_HOOK VARIABLE ACCESS)
    if("${${VARIABLE}}" STREQUAL "")
      set(CMAKE_CURRENT_LIST_DIR ${PROJECT_JRL_CMAKE_MODULE_DIR})
      set(JRL_CMAKEMODULE_LOGGING_FILENAME
          "${PROJECT_JRL_CMAKE_BINARY_DIR}/config.log")
      setup_project_finalize()
      set(CMAKE_CURRENT_LIST_DIR "") # restore value
      set(JRL_CMAKEMODULE_LOGGING_FILENAME "") # restore value
    endif()
  endfunction()
endif()

# --------------------- # Project configuration # --------------------- #

# _ADD_TO_LIST LIST VALUE
# -----------------------
#
# Add a value to a comma-separated list.
#
# LIST            : the list. VALUE           : the value to be appended.
# SEPARATOR       : the separation symol.
#
macro(_ADD_TO_LIST LIST VALUE SEPARATOR)
  if("${${LIST}}" STREQUAL "")
    set(${LIST} "${VALUE}")
  else("${${LIST}}" STREQUAL "")
    if(NOT "${VALUE}" STREQUAL "")
      set(${LIST} "${${LIST}}${SEPARATOR} ${VALUE}")
    endif(NOT "${VALUE}" STREQUAL "")
  endif("${${LIST}}" STREQUAL "")
endmacro(
  _ADD_TO_LIST
  LIST
  VALUE)

# _ADD_TO_LIST_IF_NOT_PRESENT LIST VALUE
# -----------------------
#
# Add a value to a CMake standard list list.
#
# LIST            : the list. VALUE           : the value to be appended.
#
macro(_ADD_TO_LIST_IF_NOT_PRESENT LIST VALUE)
  # To be more robust, value should be stripped
  if(NOT "${VALUE}" IN_LIST ${LIST})
    list(APPEND ${LIST} "${VALUE}")
  endif()
endmacro(
  _ADD_TO_LIST_IF_NOT_PRESENT
  LIST
  VALUE)

# _CONCATENATE_ARGUMENTS
# ----------------------
#
# Concatenate all arguments into the output variable.
#
# OUTPUT  : the output variable. SEPARTOR        : the list separation symbol.
# ARG1...ARGN     : the values to be concatenated.
#
macro(_CONCATENATE_ARGUMENTS OUTPUT SEPARATOR)
  foreach(I RANGE 2 ${ARGC})
    _add_to_list("${OUTPUT}" "${ARGV${I}}" "${SEPARATOR}")
  endforeach(I RANGE 2 ${ARGC})
  message(${${OUTPUT}})
endmacro(_CONCATENATE_ARGUMENTS OUTPUT)

# .rst: .. ifmode:: internal
#
# .. command:: SETUP_PROJECT
#
# Initialize the project. Should be called first in the root CMakeList.txt.
#
# This function does not take any argument but check that some variables are
# defined (see documentation at the beginning of this file).
#
# .. warning::
#
# This function should not be called manually. Instead, simply call
# project(\${PROJECT_NAME} CXX) after including cmake/base.cmake You can also
# remove setup_project_finalize() call.
#
macro(SETUP_PROJECT)
  # Define project name.
  project(${PROJECT_NAME} CXX)
  if(${CMAKE_VERSION} VERSION_GREATER 3.15)
    message(
      "Please update your CMakeLists: instead of setup_project() simply call project(\${PROJECT_NAME} CXX) after including cmake/base.cmake\nYou can also remove setup_project_finalize() call"
    )
  endif()
endmacro(SETUP_PROJECT)

# .rst: .. ifmode:: internal
#
# .. command:: SETUP_PROJECT_FINALIZE
#
# Called automatically at the end of the CMakeLists.txt to finalize the project
# setup.
#
macro(SETUP_PROJECT_FINALIZE)
  if(INSTALL_PKG_CONFIG_FILE)
    _setup_project_pkg_config_finalize()
  endif(INSTALL_PKG_CONFIG_FILE)
  _setup_project_documentation_finalize()
  _setup_project_header_finalize()
  _setup_coverage_finalize()
  _setup_debian()
  # Install data if needed
  _install_project_data()

  logging_finalize()
  if(PROJECT_USE_CMAKE_EXPORT)
    setup_project_package_finalize()
  endif()
endmacro(SETUP_PROJECT_FINALIZE)

# .rst: .. ifmode:: user
#
# .. command:: COMPUTE_PROJECT_ARGS (OUTPUT_VARIABLE [LANGUAGES <languages>...])
#
# Compute the arguments to be passed to command PROJECT. For instance::
#
# COMPUTE_PROJECT_ARGS(PROJECT_ARGS LANGUAGES CXX) PROJECT(${PROJECT_NAME}
# ${PROJECT_ARGS})
#
# :param OUTPUT_VARIABLE: the variable where to write the result :param
# LANGUAGES: the project languages. It defaults to CXX.
#
macro(COMPUTE_PROJECT_ARGS _project_VARIABLE)
  cmake_parse_arguments(_project "" "" "LANGUAGES" ${ARGN})
  if(NOT DEFINED _project_LANGUAGES)
    set(_project_LANGUAGES "CXX")
  endif()

  set(${_project_VARIABLE}
      VERSION ${PROJECT_VERSION_FULL} LANGUAGES ${_project_LANGUAGES}
      DESCRIPTION ${PROJECT_DESCRIPTION})
endmacro(COMPUTE_PROJECT_ARGS)

# .rst: .. ifmode:: user
#
# .. command:: SET_DEFAULT_CMAKE_BUILD_TYPE
# (Release|Debug|RelWithDebInfo|MinSizeRel)
#
# Set the default value of CMAKE_BUILD_TYPE if it is not already defined by the
# user.
#
macro(SET_DEFAULT_CMAKE_BUILD_TYPE build_type)
  string(TOLOWER "${build_type}" build_type_lower)

  if(NOT "${build_type_lower}" MATCHES
     "(debug)|(release)|(relwithdebinfo)|(minsizerel)")
    message(
      FATAL_ERROR
        "${build_type} value does not match with Debug, Release, RelWithDebInfo or MinSizeRel"
    )
  endif()

  if(NOT CMAKE_BUILD_TYPE
     AND NOT CMAKE_CONFIGURATION_TYPES
     AND NOT DEFINED ENV{CMAKE_BUILD_TYPE})
    set(CMAKE_BUILD_TYPE
        ${build_type}
        CACHE STRING "Choose the build type value." FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release"
                                                 "RelWithDebInfo" "MinSizeRel")
    message(
      STATUS "CMAKE_BUILD_TYPE has automatically been set to ${build_type}")
  endif()
endmacro(SET_DEFAULT_CMAKE_BUILD_TYPE)
