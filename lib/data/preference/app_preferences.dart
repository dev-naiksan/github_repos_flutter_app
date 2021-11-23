import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static AppPreferences? _appPreferences;
  static late SharedPreferences _sharedPreferences;
  static late FlutterSecureStorage _secureSharedPreferences;

  final String _walkthroughShownKey = "walk-through_shown";
  final String _firebaseTokenKey = "firebase_token";
  final String _savedFirebaseTokenKey = "saved_firebase_token";
  final String _jwtTokenKey = "jwt_token";
  final String _deepLinkKey = "deeplink";

  AppPreferences._();

  static Future<AppPreferences> getInstance() async {
    if (_appPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
      _secureSharedPreferences = FlutterSecureStorage();
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

  Future<void> saveJwtToken(String value) =>
      _setStringSecure(_jwtTokenKey, value);

  Future<String?> getJwtToken() => _getStringSecure(_jwtTokenKey);

  Future<void> clearJwtToken() => _deleteStringSecure(_jwtTokenKey);

  Future<void> saveStr(String key, String value) =>
      _setStringSecure(key, value);

  Future<String?> getStrSecure(String key) => _getStringSecure(key);

  Future reload() => _sharedPreferences.reload();

  //new firebaseToken
  Future<void> saveFirebaseToken(String value) =>
      _setStringSecure(_firebaseTokenKey, value);

  Future<String?> getFirebaseToken() => _getStringSecure(_firebaseTokenKey);

  //saved firebaseToken
  Future<void> setSavedFirebaseToken(String value) =>
      _setStringSecure(_savedFirebaseTokenKey, value);

  Future<String?> getSavedFirebaseToken() =>
      _getStringSecure(_savedFirebaseTokenKey);

  Future<void> clearFirebaseTokens() => Future.any([
        _deleteStringSecure(_firebaseTokenKey),
        _deleteStringSecure(_savedFirebaseTokenKey),
      ]);

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

  Future<void> _setStringSecure(String key, String value) =>
      _secureSharedPreferences.write(key: key, value: value);

  Future<void> _deleteStringSecure(String key) =>
      _secureSharedPreferences.delete(key: key);

  String? _getString(String key, {String? def}) {
    return _sharedPreferences.containsKey(key)
        ? _sharedPreferences.getString(key)
        : def;
  }

  Future<String?> _getStringSecure(
    String key, {
    String? def,
  }) async {
    var contains = await _secureSharedPreferences.containsKey(key: key);
    if (contains) {
      return _secureSharedPreferences.read(key: key);
    }
    return def;
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
