
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

set(DNACalib_VERSION 6.8.0)

if(NOT TARGET dnacalib)
    include(${CMAKE_CURRENT_LIST_DIR}/DNACalibTargets.cmake)
endif()

set_and_check(DNACalib_INCLUDE_DIR "D:/Github/Metahuman-DNA-Calibration/MetaHuman-DNA-Calibration/dnacalib/DNACalib/include")
set_and_check(DNACalib_LIB_DIR "${PACKAGE_PREFIX_DIR}")

check_required_components(DNACalib)
