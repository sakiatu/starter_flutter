import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
  Get.lazyPut(() => ThemeController(localDb));

  //Services
  // Get.lazyPut(() => AuthService(Get.find()));
}
