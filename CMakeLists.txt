cmake_minimum_required(VERSION 3.6.0)

project( WjCryptLib )



# release
ADD_DEFINITIONS(-DNDEBUG)
SET(CMAKE_C_FLAGS "-O3")
SET(CMAKE_CXX_FLAGS "-O3")

# debug
#SET(CMAKE_C_FLAGS "-O3 -g3")
#SET(CMAKE_CXX_FLAGS "-O3 -g3")



# WjCryptLib Static Library
add_library( WjCryptLib STATIC
	lib/aes.h
	lib/aes.c
	lib/aesCbc.h
	lib/aesCbc.c
	lib/aesCtr.h
	lib/aesCtr.c
	lib/aesOfb.h
	lib/aesOfb.c
	lib/md5.h
	lib/md5.c
	lib/rc4.h
	lib/rc4.c
	lib/sha1.h
	lib/sha1.c
	lib/sha256.h
	lib/sha256.c
	lib/sha512.h
	lib/sha512.c )

target_include_directories( WjCryptLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib )
set_target_properties ( WjCryptLib PROPERTIES FOLDER lib )



# WjCryptLib SHARED Library(动态库, 不能与静态库重名, 因此加了个后缀)
add_library( WjCryptLibEx SHARED
	lib/aes.h
	lib/aes.c
	lib/aesCbc.h
	lib/aesCbc.c
	lib/aesCtr.h
	lib/aesCtr.c
	lib/aesOfb.h
	lib/aesOfb.c
	lib/md5.h
	lib/md5.c
	lib/rc4.h
	lib/rc4.c
	lib/sha1.h
	lib/sha1.c
	lib/sha256.h
	lib/sha256.c
	lib/sha512.h
	lib/sha512.c )

target_include_directories( WjCryptLibEx PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/lib )
set_target_properties ( WjCryptLibEx PROPERTIES FOLDER lib )



# Add the demo project directories
add_subdirectory( projects/test )
add_subdirectory( projects/md5String )
add_subdirectory( projects/rc4Output )
add_subdirectory( projects/sha1String )
add_subdirectory( projects/sha256String )
add_subdirectory( projects/sha512String )
add_subdirectory( projects/aesBlock )
add_subdirectory( projects/aesCtrOutput )
add_subdirectory( projects/aesOfbOutput )





#
# 设置install target
#
# cmake 安装文件
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/build/libWjCryptLib.a DESTINATION lib)
install(FILES ${CMAKE_CURRENT_SOURCE_DIR}/build/libWjCryptLibEx.so DESTINATION lib)

# cmake 安装目录
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib DESTINATION include)




