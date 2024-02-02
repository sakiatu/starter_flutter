import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static final LocalDb _ld = LocalDb._();

  factory LocalDb() => _ld;

  LocalDb._();

  late final SharedPreferences _db;

  Future<void> init() async => _db = await SharedPreferences.getInstance();

  //keys
  static const _token = "authToken";
  static const _userId = "userId";
  static const _darkMode = "darkMode";

  //getter
  String? get token => _db.getString(_token);

  String? get userId => _db.getString(_userId);

  bool get darkMode => _db.getBool(_darkMode)?? false;

  //setter
  Future<void> saveToken(String? value) async => _save(_token, value);

  Future<void> saveUserId(String? value) async => await _save(_userId, value);

  Future<void> saveDarkMode(bool? value) async => await _save(_darkMode, value);

  //clear
  Future<void> clearAll() async => await _db.clear();

  //helper
  Future<void> _save(String key, Object? value) async {
    if (value == null) {
      await _db.remove(key);
    } else if (value is String) {
      await _db.setString(key, value);
    } else if (value is bool) {
      await _db.setBool(key, value);
    } else if (value is int) {
      await _db.setInt(key, value);
    } else if (value is double) {
      await _db.setDouble(key, value);
    } else if (value is List<String>) {
      await _db.setStringList(key, value);
    } else {
      throw Exception('LocalDb Error: Type not found');
    }
  }
}
