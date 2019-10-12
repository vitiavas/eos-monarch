
	
# Create eos-monarch accounts and distribute EOS by it's rams,cpu and bandwidth
# The main application accounts are login, rfidscanner and storage. These 3 accounts will hold smart contracts
# vasylkovskyi and producernode are test accounts. Here we register them both as a candidates for a producer nodes.
# After that initial setting, vasylkovskyi votes in producernod and makes him a producer.
# at the end, 3 smart contracts are deployed to 3 accounts and the network is ready.

cleos wallet open 5JXGjFtXTHzyoPjTRfeSAukV9NQWrcA2EaobnraGstwm541RQxh
cleos wallet unlock --password PW5K7e8EgKRuX8aY4rr6e6SicrY6ECbT86sMDzB1X9BGyCR1xwKnZ

cleos system newaccount eosio --transfer login EOS8VYDzQq9nNG3VvjUPJm3omoxGAr72udS4Hxv65pqdLRChZCVS4 --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
cleos system newaccount eosio --transfer rfidscanner EOS5Y8r9j1NV9YtmZLs9p25e3Dy7MPchacBUuoLavNVKycbxwisky --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
cleos system newaccount eosio --transfer storage EOS8AU947D49kaUHmE2FQQuvQWSAR9WZMkPD7frYf1i3Rpu111doM --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
cleos system newaccount eosio --transfer vasylkovskyi EOS8X35LpTuJAXhYQzHtDroRLqp7RbD55BxGyoXcBJsSzpwRbL5Hx --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192

cleos system newaccount eosio --transfer producernode EOS77ae91RGsSTCezvdqGXbi9zc1mzNKY8F1GsQUg5YiDEyxtVc5J --stake-net "150000000.0000 SYS" --stake-cpu "150000000.0000 SYS" --buy-ram-kbytes 8192

cleos system regproducer producernode EOS77ae91RGsSTCezvdqGXbi9zc1mzNKY8F1GsQUg5YiDEyxtVc5J EOS77ae91RGsSTCezvdqGXbi9zc1mzNKY8F1GsQUg5YiDEyxtVc5J
cleos system regproducer vasylkovskyi EOS8X35LpTuJAXhYQzHtDroRLqp7RbD55BxGyoXcBJsSzpwRbL5Hx  EOS8X35LpTuJAXhYQzHtDroRLqp7RbD55BxGyoXcBJsSzpwRbL5Hx

cleos system voteproducer prods vasylkovskyi producernode


# cleos create account eosio login EOS8VYDzQq9nNG3VvjUPJm3omoxGAr72udS4Hxv65pqdLRChZCVS4 -p eosio@active
# cleos create account eosio rfidscanner EOS5Y8r9j1NV9YtmZLs9p25e3Dy7MPchacBUuoLavNVKycbxwisky -p eosio@active
# cleos create account eosio storage EOS8AU947D49kaUHmE2FQQuvQWSAR9WZMkPD7frYf1i3Rpu111doM -p eosio@active
# cleos create account eosio vasylkovskyi EOS8X35LpTuJAXhYQzHtDroRLqp7RbD55BxGyoXcBJsSzpwRbL5Hx -p eosio@active


# Makes producernode an idle producer.
# nodeos --producer-name producernode --plugin eosio::chain_api_plugin --plugin eosio::net_api_plugin --http-server-address 127.0.0.1:8889 --p2p-listen-endpoint 127.0.0.1:9877 --p2p-peer-address 127.0.0.1:9876 --config-dir node2 --data-dir node2 --private-key [\"EOS69An8suzzAzXEbHz3snCnrcbALE4CSrNSBjkmvSC2dQyRZVEv3\",\"5Ja6HUgNgB55uxtYcuvmE5fcfr2QfoZWKYX42Tk65gY3cCv3QMa\"]
# cleos push action eosio setprods "{ \"schedule\": [{\"producer_name\": \"producernode\",\"block_signing_key\": \"EOS69An8suzzAzXEbHz3snCnrcbALE4CSrNSBjkmvSC2dQyRZVEv3\"}]}" -p eosio@active

# cleos wallet import --private-key $key



cleos wallet lock
