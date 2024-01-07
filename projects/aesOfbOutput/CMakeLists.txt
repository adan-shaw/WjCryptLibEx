add_executable( aesOfbOutput aesOfbOutput.c )
target_link_libraries( aesOfbOutput WjCryptLib )

install(TARGETS aesOfbOutput DESTINATION bin)

