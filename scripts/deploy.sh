cleos wallet open
cleos wallet unlock --password PW5K7e8EgKRuX8aY4rr6e6SicrY6ECbT86sMDzB1X9BGyCR1xwKnZ

cleos set contract login build/login -p login@active
cleos set contract rfidscanner build/rfidscanner -p rfidscanner@active
cleos set contract storage build/storage -p storage@active

cleos wallet lock
