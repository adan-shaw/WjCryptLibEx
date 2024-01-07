SET( MODULE_NAME test )

add_executable( ${MODULE_NAME}
	test.c
	test_Hashes.c
	test_Hashes.h
	test_Rc4.c
	test_Rc4.h
	test_Aes.c
	test_Aes.h
	test_AesCbc.c
	test_AesCbc.h
	test_AesCtr.c
	test_AesCtr.h
	test_AesOfb.c
	test_AesOfb.h
)
target_link_libraries( ${MODULE_NAME} WjCryptLib )

install(TARGETS ${MODULE_NAME} DESTINATION bin)
