eosio-cpp contracts/login/login.cpp -o contracts/login/login.wasm --abigen --contract=login
eosio-cpp contracts/rfidscanner/rfidscanner.cpp -o contracts/rfidscanner/rfidscanner.wasm --abigen --contract=rfidscanner
eosio-cpp contracts/storage/storage.cpp -o contracts/storage/storage.wasm --abigen --contract=storage