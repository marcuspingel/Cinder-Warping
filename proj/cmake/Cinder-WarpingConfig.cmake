if( NOT TARGET Cinder-Warping )

    get_filename_component( CINDER_WARPING_BLOCK_PATH "${CMAKE_CURRENT_LIST_DIR}/../.." ABSOLUTE )
    get_filename_component( CINDER_WARPING_INCLUDE_PATH "${CINDER_WARPING_BLOCK_PATH}/src" ABSOLUTE )

    if( NOT EXISTS ${CINDER_PATH} )
        get_filename_component( CINDER_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../.." ABSOLUTE )
    endif()

    add_library( Cinder-Warping
            ${CINDER_WARPING_INCLUDE_PATH}/Warp.cpp
            ${CINDER_WARPING_INCLUDE_PATH}/WarpBilinear.cpp
            ${CINDER_WARPING_INCLUDE_PATH}/WarpPerspective.cpp
            ${CINDER_WARPING_INCLUDE_PATH}/WarpPerspectiveBilinear.cpp
            )

    target_include_directories( Cinder-Warping PUBLIC "${CINDER_WARPING_INCLUDE_PATH}" )

    if( NOT TARGET cinder )
        include( "${CINDER_PATH}/proj/cmake/configure.cmake" )
        find_package( cinder REQUIRED PATHS
                "${CINDER_PATH}/${CINDER_LIB_DIRECTORY}"
                "$ENV{CINDER_PATH}/${CINDER_LIB_DIRECTORY}" )
    endif()
    target_link_libraries( Cinder-Warping PRIVATE cinder )

endif()
