import 'dart:convert';

import 'package:drawer/models/user.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<bool> saveUserData(User user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("user_data", userJson);
      return true;
    } catch (e) {
      print("Error saving user data; $e");
      return false;
    }
  }

  Future<User?> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString("user_data");

      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        return User.fromJson(userMap);
      }
      return null;
    } catch (e) {
      print("error loging data: $e");
      return null;
    }
  }
}
