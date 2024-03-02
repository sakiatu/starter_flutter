import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/const/config.dart';
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

      String? url;
      bool updateMode = false;
      if (!kIsWeb) {
        int? min;
        if (Platform.isAndroid) {
          min = '${map['min_android_version']}'.tryInt;
          url = map['android_app_url'];
        } else if (Platform.isIOS) {
          min = '${map['min_ios_version']}'.tryInt;
          url = map['ios_app_url'];
        }
        updateMode = min != null && min > MyConfig.appVersion;
      }

      return Right(Config(maintenanceMode: map['maintenance'] == 'true', updateMode: updateMode, appUrl: url ?? ''));
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
