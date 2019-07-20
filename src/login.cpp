#include <login.hpp>

ACTION login::hi(name user) {
  require_auth(user);
  print("Hello, ", name{user});
}
