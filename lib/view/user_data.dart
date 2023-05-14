
import '../model/user_detail.dart';

class UserData {
  static List<User> users = [
    User(email: 'bob@example.com', password: 'password1', balance: 10000),
    User(email: 'user2@example.com', password: 'password2', balance: 20000),
  ];

  static User? getUserByEmail(String email) {
    return users.firstWhere((user) => user.email == email);
  }

  static void updateUserBalance(String email, double amount) {
    User? user = getUserByEmail(email);
    if (user != null) {
      user.balance -= amount;
    }
  }
}
