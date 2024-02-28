import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/extension/string.dart';
import '../../../../core/util/typedef.dart';
import '../../domain/entity/config_entity.dart';
import '../../domain/param/get_config_param.dart';
import '../../domain/repository/config_repo.dart';
import '../source/config_data_source.dart';

class ConfigRepo extends IConfigRepo {
  final ConfigDataSource _configDataSource;

  ConfigRepo(this._configDataSource);

  @override
  FutureResult<Config> getConfig(GetConfig e) async {
    try {
      final list = await _configDataSource.getConfig(e);
      final map = {for (var e in list) e.key: e.value};
      return Right(Config(
          maintenanceMode: map['maintenance'] == 'true',
          minAndroidVersion: '${map['min_android_version']}'.tryInt ?? 0,
          minIosVersion: '${map['min_ios_version']}'.tryInt ?? 0,
          androidAppUrl: map['android_app_url'] ?? '',
          iosAppUrl: map['ios_app_url'] ?? ''));
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
