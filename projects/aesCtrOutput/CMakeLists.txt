add_executable( aesCtrOutput aesCtrOutput.c )
target_link_libraries( aesCtrOutput WjCryptLib )

install(TARGETS aesCtrOutput DESTINATION bin)

