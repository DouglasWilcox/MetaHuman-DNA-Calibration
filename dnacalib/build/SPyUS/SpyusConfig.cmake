
####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was Config.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/" ABSOLUTE)

macro(set_and_check _var _file)
  set(${_var} "${_file}")
  if(NOT EXISTS "${_file}")
    message(FATAL_ERROR "File or directory ${_file} referenced by variable ${_var} does not exist !")
  endif()
endmacro()

macro(check_required_components _NAME)
  foreach(comp ${${_NAME}_FIND_COMPONENTS})
    if(NOT ${_NAME}_${comp}_FOUND)
      if(${_NAME}_FIND_REQUIRED_${comp})
        set(${_NAME}_FOUND FALSE)
      endif()
    endif()
  endforeach()
endmacro()

####################################################################################

set(Spyus_VERSION 1.2.1)

if(NOT TARGET spyus)
    include(${CMAKE_CURRENT_LIST_DIR}/SpyusTargets.cmake)
endif()

set_and_check(Spyus_INCLUDE_DIR "D:/Github/Metahuman-DNA-Calibration/MetaHuman-DNA-Calibration/dnacalib/SPyUS/include")
set_and_check(Spyus_LIB_DIR "${PACKAGE_PREFIX_DIR}")

check_required_components(Spyus)
