import 'package:get/get.dart';

import '../../helper/local_db.dart';

class ThemeController extends GetxController implements GetxService {
  final LocalDb _db;

  bool get darkMode => _db.darkMode;

  ThemeController(this._db);

  Future<void> toggleTheme() async {
    await _db.saveDarkMode(!darkMode);
    update();
  }
}
