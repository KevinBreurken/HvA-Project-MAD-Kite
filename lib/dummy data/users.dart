class User {
  final String name;
  final String email;
  final String password;

  User({
    required this.name, 
    required this.email, 
    required this.password
  });

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password}';
  }
}

List<User> allUsers = [
  User(name: "Shano", email: "shano @gmail.com", password: "123456"),
  User(name: "Alexander", email: "alexander@gmail.com", password: "123456"),
  User(name: "Quillano", email: "quillano@gmail.com", password: "123456"),
  User(name: "Kevin", email: "kevin@gmail.com", password: "123456"),
];