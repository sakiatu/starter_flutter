import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../api/api_client.dart';
import '../api/api_helper.dart';
import '../const/config.dart';
import '../feature/auth/controller_auth.dart';
import '../feature/auth/service_auth.dart';
import '../feature/config/controller_config.dart';
import '../feature/config/service_config.dart';
import '../feature/theme/controller_theme.dart';
import '../feature/update/controller_update.dart';
import 'local_db.dart';

Future<void> init() async {
  //Local database
  final localDb = LocalDb();
  await localDb.init();

  //graphQL cache
  await initHiveForFlutter();

  //API helper
  final apiHelper = ApiHelper(FirebaseAuth.instance, localDb);

  //API
  Get.lazyPut(() => ApiClient(MyConfig.baseUrl, apiHelper));

  //Controllers
  Get.lazyPut(() => ConfigController(Get.find()));
  Get.lazyPut(() => AuthController(Get.find()));
  Get.lazyPut(() => ThemeController(localDb));
  Get.lazyPut(() => UpdateController());

  //Services
  Get.lazyPut(() => ConfigService(Get.find()));
  Get.lazyPut(() => AuthService(Get.find(), localDb));
}
