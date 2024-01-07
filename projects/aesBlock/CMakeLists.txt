add_executable( aesBlock aesBlock.c )
target_link_libraries( aesBlock WjCryptLib )

install(TARGETS aesBlock DESTINATION bin)
