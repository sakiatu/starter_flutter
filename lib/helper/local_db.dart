import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  static final LocalDb _instance = LocalDb._internal();

  factory LocalDb() => _instance;

  LocalDb._internal();

  late SharedPreferences _db;

  Future<void> init() async => _db = await SharedPreferences.getInstance();

  //keys
  static const _token = "authToken";
  static const _userId = "userId";
  static const _darkMode = "darkMode";

  String? get token => _db.getString(_token);

  String? get userId => _db.getString(_userId);

  bool get darkMode => _db.getBool(_darkMode)?? false;

  Future<void> saveToken(String? value) async => _save(_token, value);

  Future<void> saveUserId(String? value) async => await _save(_userId, value);

  Future<void> saveDarkMode(bool? value) async => await _save(_darkMode, value);

  Future<void> clearAll() async => await _db.clear();

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
