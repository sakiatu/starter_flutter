import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/feature/theme/theme_cubit.dart';


import 'core/api/api_client.dart';
import 'core/api/api_helper.dart';
import 'core/const/config.dart';
import 'core/database/local_db.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //graphQL cache
  await initHiveForFlutter();
  final localDb = await LocalDb.init();

  getIt
    //Local database
    ..registerSingleton(localDb)
    //API
    ..registerSingleton(ApiClient(MyConfig.baseUrl, ApiHelper(FirebaseAuth.instance, getIt())))
    //blocs
    ..registerFactory(() => ThemeCubit(getIt()));
}
