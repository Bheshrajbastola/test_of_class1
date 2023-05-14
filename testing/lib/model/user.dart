class User {
  final String accountNo;
  final String firstName;
  final String lastName;
  final String address;
  final String email;
  final String phoneNumber;
  double balance;
  final String password;

  User({
    required this.accountNo,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.phoneNumber,
    this.balance = 1000.0,
    required this.password,
  });
}
