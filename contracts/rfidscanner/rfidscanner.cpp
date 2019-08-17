#include <eosio/eosio.hpp>

using namespace std;
using namespace eosio;
class [[eosio::contract("rfidscanner")]] rfidscanner : public eosio::contract {

  private:

    struct [[eosio::table]] rfid_event {
      name            user;
      std::string id;
      std::string uid;
      std::string start_date;
      std::string end_date;

      auto primary_key() const { return user.value; }
    };
    

    typedef eosio::multi_index<name("rfids"), rfid_event> rfid_table;

    rfid_table _rfids;


  public:

    rfidscanner( name receiver, name code, datastream<const char*> ds ):contract(receiver, code, ds),
                       _rfids(receiver, receiver.value) {}

    [[eosio::action]]
    void insert(name user, std::string id, std::string uid, std::string start_date, std::string end_date) {
        // Ensure this action is authorized by the user
        require_auth(user);
        // get_self -> name of this contract
        // get_first_receiver -> scope (Since we have only 1 table. get_first_receiver ensures that only 1 will be taken)
        rfid_table rfids(get_self(), get_first_receiver().value);
        // Create a record in the table
        // auto iterator = rfids.find(user);
        // eosio::check( iterator == rfids.end(), "Rfid Repetido!");
        rfids.emplace(user, [&](auto &new_rfid) {
            new_rfid.user = user;
            new_rfid.id = id;
            new_rfid.uid = uid;
            new_rfid.start_date = start_date;
            new_rfid.end_date = end_date;
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

EOSIO_DISPATCH(rfidscanner, (insert))