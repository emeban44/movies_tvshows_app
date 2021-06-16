import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences _sharedPrefs;
  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  void setOverTwoCharacters(bool value) {
    _sharedPrefs.setBool('overTwo', value);
  }

  bool get getOverTwoCharactersBool {
    return _sharedPrefs.getBool('overTwo');
  }
}
