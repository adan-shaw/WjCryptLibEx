add_executable( rc4Output rc4Output.c )
target_link_libraries( rc4Output WjCryptLib )

install(TARGETS rc4Output DESTINATION bin)

