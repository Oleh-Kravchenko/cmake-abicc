# Input arguments:
# VERSION
# HEADERS
# LIBS
# INCLUDE_PATHS
# GCC_OPTIONS
# CROSS_PREFIX
# TOOLS
# DEFINES
# SEARCH_LIBS
# CMAKE_ABICC_DIR
# PROJECT_ABICC_XML

CMAKE_POLICY(SET CMP0007 NEW)

# unescape ARGS
FUNCTION(UNESCAPE_ARGS)
	FOREACH(arg ${ARGV})
		IF(NOT ${arg})
			CONTINUE()
		ENDIF()

		LIST(REMOVE_DUPLICATES ${arg})
		# serialize list to string
		STRING(REPLACE ";" "\n" ${arg} "${${arg}}")
		SET(${arg} "${${arg}}" PARENT_SCOPE)
	ENDFOREACH()
ENDFUNCTION()

# unscape arguments
UNESCAPE_ARGS(
	VERSION
	HEADERS
	LIBS
	INCLUDE_PATHS
	GCC_OPTIONS
	CROSS_PREFIX
	TOOLS)

# unscape DEFINES
IF(DEFINES)
	LIST(REMOVE_DUPLICATES DEFINES)
	# serialize defines to code
	FOREACH(define ${DEFINES})
		IF(define MATCHES "([_a-zA-Z][_a-zA-Z0-9]*)=(.+)")
			LIST(APPEND defines
				"#define ${CMAKE_MATCH_1} ${CMAKE_MATCH_2}")
		ELSE()
			LIST(APPEND defines "#define ${define}")
		ENDIF()
	ENDFOREACH()
	# serialize defines to strings
	STRING(REPLACE ";" "\n" DEFINES "${defines}")
ENDIF()

# unescape SEARCH_LIBS
IF(SEARCH_LIBS)
	FOREACH(lib ${SEARCH_LIBS})
		GET_FILENAME_COMPONENT(dir "${lib}" DIRECTORY)
		LIST(APPEND search_libs "${dir}")
	ENDFOREACH()
	LIST(REMOVE_DUPLICATES search_libs)
	STRING(REPLACE ";" "\n" SEARCH_LIBS "${search_libs}")
ENDIF()

# generate XML for abi-compliance-checker
CONFIGURE_FILE("${CMAKE_ABICC_DIR}/descriptor.xml.in"
	       "${PROJECT_ABICC_XML}" @ONLY)
