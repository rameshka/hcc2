if(POLICY CMP0046)
  cmake_policy(PUSH)
  cmake_policy(SET CMP0046 OLD)
endif()

# MCWAMP
set(MCWAMP_INC_DIR "${PROJECT_SOURCE_DIR}/include")

# Imported targets
include(ImportedTargets)

# Additional compile-time options for HCC runtime could be set via:
# - HCC_RUNTIME_CFLAGS
#
# For example: cmake -DHCC_RUNTIME_CFLAGS=-g would configure HCC runtime be built
# with debug information while other parts are not.

macro(add_libcxx_option_if_needed name)
  if (USE_LIBCXX)
    target_include_directories(${name} SYSTEM PUBLIC ${LIBCXX_HEADER})
    target_compile_options(${name} PUBLIC -stdlib=libc++)
    if (NOT HCC_TOOLCHAIN_RHEL)
      target_link_libraries(${name} INTERFACE c++abi)
    endif()
    add_definitions(-DUSE_LIBCXX)
  endif (USE_LIBCXX)
endmacro(add_libcxx_option_if_needed name)

macro(amp_target name )
  set(CMAKE_CXX_COMPILER "${PROJECT_BINARY_DIR}/../../bin/clang++")
  add_compile_options(-std=c++11)
  target_include_directories(${name} SYSTEM PRIVATE ${LIBCXX_INC_DIR})
  target_include_directories(${name} PRIVATE ${MCWAMP_INC_DIR})
  target_include_directories(${name} SYSTEM INTERFACE $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/include>)
  add_libcxx_option_if_needed(${name})
  target_compile_options(${name} PUBLIC -std=c++amp -fPIC)

  # Enable debug line info only if it's a release build and HCC_RUNTIME_DEBUG is OFF
  # Otherwise, -gline-tables-only would override other existing debug flags
  if ((NOT HCC_RUNTIME_DEBUG) AND ("${CMAKE_BUILD_TYPE}" STREQUAL "Release"))
	  target_compile_options(${name} PUBLIC -gline-tables-only)
  endif ((NOT HCC_RUNTIME_DEBUG) AND ("${CMAKE_BUILD_TYPE}" STREQUAL "Release"))
endmacro(amp_target name )

####################
# C++AMP runtime interface (mcwamp) 
####################
macro(add_mcwamp_library name )
  add_library( ${name} ${ARGN} )
  amp_target(${name})
  target_link_libraries(${name} unwind)
  # LLVM and Clang shall be compiled beforehand
  add_dependencies(${name} llvm-link opt clang)
endmacro(add_mcwamp_library name )

####################
# C++AMP runtime (CPU implementation)
####################
macro(add_mcwamp_library_cpu name )
  add_library( ${name} SHARED ${ARGN} )
  amp_target(${name})
  # LLVM and Clang shall be compiled beforehand
  add_dependencies(${name} llvm-link opt clang)
  add_libcxx_option_if_needed(${name})
endmacro(add_mcwamp_library_cpu name )

####################
# C++AMP runtime (HSA implementation) 
####################
macro(add_mcwamp_library_hsa name )
  add_library( ${name} SHARED ${ARGN} )
  amp_target(${name})
  # LLVM and Clang shall be compiled beforehand
  add_dependencies(${name} llvm-link opt clang hc_am)
  # add HSA libraries
  target_link_libraries(${name} hsa-runtime64)
  target_link_libraries(${name} pthread)
  target_link_libraries(${name} unwind)
  add_libcxx_option_if_needed(${name})
  target_link_libraries(${name} hc_am)
endmacro(add_mcwamp_library_hsa name )

macro(add_mcwamp_library_hc_am name )
  add_library( ${name} SHARED ${ARGN} )
  amp_target(${name})
  # LLVM and Clang shall be compiled beforehand
  add_dependencies(${name} llvm-link opt clang)
  # add HSA libraries
  target_link_libraries(${name} hsa-runtime64)
  target_link_libraries(${name} pthread)
  add_libcxx_option_if_needed(${name})
endmacro(add_mcwamp_library_hc_am name )

if(POLICY CMP0046)
  cmake_policy(POP)
endif()
