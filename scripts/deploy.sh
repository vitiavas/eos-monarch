cleos wallet open
cleos wallet unlock --password PW5JbeaXsGy9AP9yZhUNX8C8KpEQ57y1V4toaBDf1XDNs6ULn3m6t

cleos set contract login build/login -p login@active
cleos set contract rfidscanner build/rfidscanner -p rfidscanner@active
cleos set contract storage build/storage -p storage@active

cleos wallet lock
