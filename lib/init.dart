import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:starter/feature/config/data/repository/config_repo.dart';
import 'package:starter/feature/config/data/source/config_data_source.dart';
import 'package:starter/feature/config/domain/repository/config_repo.dart';
import 'package:starter/feature/config/domain/usecase/get_config_usecase.dart';
import 'package:starter/feature/config/presentation/bloc/config_bloc.dart';
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

    //blocs
    ..registerFactory(() => ThemeCubit(getIt()))
    ..registerFactory(() => ConfigBloc(getConfigUseCase: getIt()))

    //usecase
    ..registerLazySingleton(() => GetConfigUseCase(getIt()))

    //repository
    ..registerLazySingleton<IConfigRepo>(() => ConfigRepo(getIt()))

    //data source
    ..registerLazySingleton(() => ConfigDataSource(getIt()))

    //API
    ..registerLazySingleton(()=>ApiClient(MyConfig.baseUrl, ApiHelper(FirebaseAuth.instance, getIt())));

  ;
}
