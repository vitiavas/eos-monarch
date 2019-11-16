
	
# Create eos-monarch accounts and distribute EOS by it's rams,cpu and bandwidth
# The main application accounts are login, rfidscanner and storage. These 3 accounts will hold smart contracts
# vasylkovskyi and producernode are test accounts. Here we register them both as a candidates for a producer nodes.
# After that initial setting, vasylkovskyi votes in producernod and makes him a producer.
# at the end, 3 smart contracts are deployed to 3 accounts and the network is ready.

cleos wallet open PW5KSADwS62Bv263obof9SWmRBzAsdtYRSnDBb6GkGVH82v9MoTXL
cleos wallet unlock --password PW5KSADwS62Bv263obof9SWmRBzAsdtYRSnDBb6GkGVH82v9MoTXL

# cleos system newaccount eosio --transfer login EOS8MnvSN5TgTuP7CMzz4FzMqB1YpUZ7ags2223pbjgGeMG8UMu7Y --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
# cleos system newaccount eosio --transfer storage EOS6cdeSjUjSdcJcrf6sZcThD6C3nPiQQ3B7bu4Bur46bmUfhyXyT --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
# cleos system newaccount eosio --transfer vasylkovskyi EOS5yieqx6d8jZ3EkZGLu1W25cB6dwhhaCxLjYC2NYhH9fJnw7F4h --stake-net "10000000.0000 SYS" --stake-cpu "10000000.0000 SYS" --buy-ram-kbytes 8192
# cleos system newaccount eosio --transfer producernode EOS53U5EMqjMmqMR1B1Nzs9bD7fnPNttakEunHY5YbGboxxuCh4Es --stake-net "150000000.0000 SYS" --stake-cpu "150000000.0000 SYS" --buy-ram-kbytes 8192

# cleos system regproducer producernode EOS53U5EMqjMmqMR1B1Nzs9bD7fnPNttakEunHY5YbGboxxuCh4Es EOS53U5EMqjMmqMR1B1Nzs9bD7fnPNttakEunHY5YbGboxxuCh4Es
# cleos system regproducer vasylkovskyi EOS5yieqx6d8jZ3EkZGLu1W25cB6dwhhaCxLjYC2NYhH9fJnw7F4h  EOS5yieqx6d8jZ3EkZGLu1W25cB6dwhhaCxLjYC2NYhH9fJnw7F4h

# cleos system voteproducer prods vasylkovskyi producernode


cleos create account eosio login EOS8MnvSN5TgTuP7CMzz4FzMqB1YpUZ7ags2223pbjgGeMG8UMu7Y -p eosio@active
cleos create account eosio storage EOS6cdeSjUjSdcJcrf6sZcThD6C3nPiQQ3B7bu4Bur46bmUfhyXyT -p eosio@active
cleos create account eosio vasylkovskyi EOS5yieqx6d8jZ3EkZGLu1W25cB6dwhhaCxLjYC2NYhH9fJnw7F4h -p eosio@active
cleos create account eosio producernode EOS53U5EMqjMmqMR1B1Nzs9bD7fnPNttakEunHY5YbGboxxuCh4Es -p eosio@active


# Makes producernode an idle producer.
# nodeos --producer-name producernode --plugin eosio::chain_api_plugin --plugin eosio::net_api_plugin --http-server-address 127.0.0.1:8889 --p2p-listen-endpoint 127.0.0.1:9877 --p2p-peer-address 127.0.0.1:9876 --config-dir node2 --data-dir node2 --private-key [\"EOS69An8suzzAzXEbHz3snCnrcbALE4CSrNSBjkmvSC2dQyRZVEv3\",\"5Ja6HUgNgB55uxtYcuvmE5fcfr2QfoZWKYX42Tk65gY3cCv3QMa\"]
# cleos push action eosio setprods "{ \"schedule\": [{\"producer_name\": \"producernode\",\"block_signing_key\": \"EOS69An8suzzAzXEbHz3snCnrcbALE4CSrNSBjkmvSC2dQyRZVEv3\"}]}" -p eosio@active

# cleos wallet import --private-key $key



cleos wallet lock
