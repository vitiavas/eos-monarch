eosio-cpp src/login/login.cpp -o build/login/login.wasm --abigen --contract=login
eosio-cpp src/rfidscanner/rfidscanner.cpp -o build/rfidscanner/rfidscanner.wasm --abigen --contract=rfidscanner
eosio-cpp src/storage/storage.cpp -o build/storage/storage.wasm --abigen --contract=storage