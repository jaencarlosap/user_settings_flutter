import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = new UserPreferences._internal();

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set name(String value) {
    _prefs.setString('name', value);
  }

  get name {
    return _prefs.getString('name') ?? 'Carlos';
  }

  set secondColor(bool value) {
    _prefs.setBool('secondColor', value);
  }

  get secondColor {
    return _prefs.getBool('secondColor') ?? false;
  }
}
