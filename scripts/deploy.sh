cleos wallet open
cleos wallet unlock --password PW5KSADwS62Bv263obof9SWmRBzAsdtYRSnDBb6GkGVH82v9MoTXL

cleos set contract login build/login -p login@active
cleos set contract storage build/storage -p storage@active

cleos wallet lock
