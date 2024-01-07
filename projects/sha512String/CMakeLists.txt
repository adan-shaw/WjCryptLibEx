add_executable( sha512String sha512String.c )
target_link_libraries( sha512String WjCryptLib )

install(TARGETS sha512String DESTINATION bin)

