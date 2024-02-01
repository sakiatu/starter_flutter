import 'package:get/get.dart';

import '../../helper/local_db.dart';

class ThemeController extends GetxController implements GetxService {
  final LocalDb _db;

  final darkMode = false.obs;

  ThemeController(this._db);

  @override
  void onInit() {
    darkMode.value = _db.darkMode;
    super.onInit();
  }

  Future<void> toggleTheme() async {
    darkMode.value = !darkMode.value;
    await _db.saveDarkMode(darkMode.value);
    update();
  }
}
