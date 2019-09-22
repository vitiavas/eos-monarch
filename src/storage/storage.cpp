#include <eosio/eosio.hpp>
#include <eosio/crypto.hpp>
#include <eosio/transaction.hpp>

using namespace std;
using namespace eosio;
class [[eosio::contract("storage")]] storage : public eosio::contract {

  private:

    struct [[eosio::table]] records_info {
      uint64_t id;
      std::string uid;
      std::string hash;
      checksum256 txid;
      auto primary_key() const { return id; }

      // Fix the table. May need to drop all blockchain and start a new one later because of primary key uniqueness and serialization is broken
      EOSLIB_SERIALIZE( records_info, (id)(uid)(hash)(txid))

    };
    

    typedef eosio::multi_index<name("records"), records_info> records;

    records _records;

  public:

    storage( name receiver, name code, datastream<const char*> ds ):contract(receiver, code, ds),
                       _records(receiver, receiver.value) {}


    checksum256 get_trx_id() {
        size_t size = transaction_size();
        char buf[size];
        size_t read = read_transaction( buf, size );
        eosio::check( size == read, "read_transaction failed");
        return sha256( buf, read );
    }

    [[eosio::action]]
    void insert(name user, std::string hash, std::string uid, std::string file) {
        // Ensure this action is authorized by the user
        require_auth(user);
        // get_self -> name of this contract
        // get_first_receiver -> scope (Since we have only 1 table. get_first_receiver ensures that only 1 will be taken)
        // records records(get_self(), get_first_receiver().value);
        // // Create a record in the table
        _records.emplace(user, [&](auto &new_record) {
            new_record.hash = hash;
            new_record.uid = uid;
            new_record.txid = get_trx_id();
            new_record.id = _records.available_primary_key();
        });
    }
    
    [[eosio::action]]
    void eraseall() {
      records records(get_self(), get_first_receiver().value);
      auto it = records.begin();
      while (it != records.end()) {
        it = records.erase(it);
      }
    }

    [[eosio::action]]
    void erase(name user, uint64_t id) {
      require_auth(user);
      // records records(get_self(), get_first_receiver().value);
      auto iterator = _records.find(id);
      check(iterator != _records.end(), "Record does not exist");
      _records.erase(iterator);
    }

};

EOSIO_DISPATCH(storage, (insert)(erase)(eraseall))