add_executable( sha256String sha256String.c )
target_link_libraries( sha256String WjCryptLib )

install(TARGETS sha256String DESTINATION bin)
