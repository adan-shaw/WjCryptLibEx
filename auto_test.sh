#!/bin/sh

cd ./build

cd ./projects



echo "*********************"
echo "symmetric encryption:"
echo "*********************"

cd aesBlock
#./aesBlock "5ce580d560e71d5365195d3b534ffe7929efac28" "aes crypto this string"
./aesBlock
cd ..

cd aesCtrOutput
#./aesCtrOutput "5ce580d560e71d5365195d3b534ffe7929efac28" "aes crypto this string"
./aesCtrOutput
cd ..

cd aesOfbOutput
#./aesOfbOutput "5ce580d560e71d5365195d3b534ffe7929efac28" "aes crypto this string"
./aesOfbOutput
cd ..

cd rc4Output
./rc4Output
cd ..



echo "*****"
echo "hash:"
echo "*****"

cd md5String
./md5String "hash crypto this string"
cd ..

cd sha1String
./sha1String "hash crypto this string"
cd ..

cd sha256String
./sha256String "hash crypto this string"
cd ..

cd sha512String
./sha512String "hash crypto this string"
cd ..

cd test
./test
cd ..
