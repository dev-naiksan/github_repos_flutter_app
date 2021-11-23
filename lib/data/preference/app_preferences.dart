import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences? _appPreferences;
  static late SharedPreferences _sharedPreferences;

  final String _walkthroughShownKey = "walk-through_shown";
  final String _firebaseTokenKey = "firebase_token";
  final String _savedFirebaseTokenKey = "saved_firebase_token";
  final String _jwtTokenKey = "jwt_token";
  final String _deepLinkKey = "deeplink";

  AppPreferences._();

  static Future<AppPreferences> getInstance() async {
    if (_appPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _appPreferences = AppPreferences._();
    }
    return _appPreferences!;
  }

  set deepLink(String value) =>
      _sharedPreferences.setString(_deepLinkKey, value);

  String? getDeepLink() {
    return _getString(_deepLinkKey);
  }

  set walkthroughShown(bool value) => _set(_walkthroughShownKey, value);

  bool get walkthroughShown => _getBool(_walkthroughShownKey, false);

  Future reload() => _sharedPreferences.reload();

  _set(
    String key,
    dynamic value,
  ) {
    if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else {
      print('Invalid type');
    }
  }

  String? _getString(String key, {String? def}) {
    return _sharedPreferences.containsKey(key)
        ? _sharedPreferences.getString(key)
        : def;
  }

  bool _getBool(String key, [bool def = false]) {
    return _sharedPreferences.containsKey(key)
        ? _sharedPreferences.getBool(key) ?? def
        : def;
  }

  Future<bool> clear() {
    return _sharedPreferences.clear();
  }
}
