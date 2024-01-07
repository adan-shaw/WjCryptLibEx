add_executable( sha1String sha1String.c )
target_link_libraries( sha1String WjCryptLib )

install(TARGETS sha1String DESTINATION bin)

