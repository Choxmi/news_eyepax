class User {
  final String name;
  final String username;
  final String password;
  final bool logged;

  User({
    required this.name,
    required this.username,
    required this.password,
    required this.logged
  });

  // Convert a User into a Map
  Map<String,dynamic> toMap() {
    return {
      'username': username,
      'name': name,
      'password': password,
      'logged': logged,
    };
  }

  // Display user details
  @override
  String toString() {
    return 'User{username: $username, name: $name, logged_in: $logged}';
  }

}