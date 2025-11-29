import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  static const String _userKey = 'user_name';

  String _username = '';
  String get username => _username;

  UserProvider() {
    _loadUsername();
  }

  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_userKey) ?? '';
    notifyListeners();
  }

  Future<void> saveUsername(String name) async {
    _username = name;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, name);
  }
}
