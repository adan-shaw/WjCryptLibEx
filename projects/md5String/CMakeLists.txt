SET( MODULE_NAME md5String )

add_executable( ${MODULE_NAME} md5String.c )
target_link_libraries( ${MODULE_NAME} WjCryptLib )

install(TARGETS ${MODULE_NAME} DESTINATION bin)
