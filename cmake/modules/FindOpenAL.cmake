# Should work well only in MSVC

if (WIN32)
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        # 64bit
        set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/x64-MT)
    else ()
        # 32bit
        set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/x86-MT)
    endif ()
else ()
    set(LIB_PATH ${CMAKE_CURRENT_LIST_DIR}/../../prebuilt/linux-x86)
endif ()

FIND_PATH(OPENAL_INCLUDE_DIR AL/al.h
    HINTS
    ${CMAKE_CURRENT_LIST_DIR}/../../include
    PATHS
    /usr/local/include
    /usr/include
)

FIND_LIBRARY(OPENAL_LIBRARY
    NAMES libOpenAL OpenAL OpenAL32
    HINTS
    ${LIB_PATH}
    PATHS
    /usr/local/lib
    /usr/lib
)

SET(OPENAL_FOUND "NO")
IF(OPENAL_LIBRARY AND OPENAL_INCLUDE_DIR)
    SET(OPENAL_FOUND "YES")
ENDIF(OPENAL_LIBRARY AND OPENAL_INCLUDE_DIR)