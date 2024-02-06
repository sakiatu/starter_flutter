import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/feature/config/controller_config.dart';
import 'package:starter/feature/config/service_config.dart';
import 'package:starter/feature/update/controller_update.dart';

import '../api/api_client.dart';
import '../const/config.dart';
import '../feature/theme/controller_theme.dart';
import 'local_db.dart';

Future<void> init() async {
  //Local database
  final localDb = LocalDb();
  await localDb.init();

  //graphQL cache
  await initHiveForFlutter();

  //API
  Get.lazyPut(() => ApiClient(MyConfig.baseUrl, localDb, FirebaseAuth.instance));

  //Controllers
  Get.lazyPut(() => ConfigController(Get.find()));
  Get.lazyPut(() => ThemeController(localDb));
  Get.lazyPut(() => UpdateController());

  //Services
  Get.lazyPut(() => ConfigService(Get.find()));
}
