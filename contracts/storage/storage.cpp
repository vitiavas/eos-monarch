#include <eosio/eosio.hpp>

using namespace std;
using namespace eosio;
class [[eosio::contract("storage")]] storage : public eosio::contract {

  private:

    struct [[eosio::table]] private_data {
      name            user;
      std::string id;


      auto primary_key() const { return user.value; }
    };
    

    typedef eosio::multi_index<name("records"), private_data> list;

    list _records;


  public:

    storage( name receiver, name code, datastream<const char*> ds ):contract(receiver, code, ds),
                       _records(receiver, receiver.value) {}

    [[eosio::action]]
    void insert(name user, std::string id) {
        // Ensure this action is authorized by the user
        require_auth(user);
        // get_self -> name of this contract
        // get_first_receiver -> scope (Since we have only 1 table. get_first_receiver ensures that only 1 will be taken)
        list records(get_self(), get_first_receiver().value);
        // Create a record in the table
        records.emplace(user, [&](auto &new_record) {
            new_record.user = user;
            new_record.id = id;
        });
        
    }
    

    // [[eosio::action]]
    // void erase(name user) {
    //   // require_auth(user);
    //   users_table users(get_self(), get_first_receiver().value);
    //   auto iterator = users.find(user.value);
    //   check(iterator != users.end(), "Record does not exist");
    //   users.erase(iterator);
    // }

};

EOSIO_DISPATCH(storage, (insert))