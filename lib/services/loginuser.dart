
import 'package:shared_preferences/shared_preferences.dart';

class user {
  String name;
  String username;

  user({required this.name, required this.username});

  Future<user?> login(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');

    if (storedUsername == username && storedPassword == password) {
      String? name = prefs.getString('name');
      return user(name: name!, username: username);
    } else {
      return null;
    }
  }
}
