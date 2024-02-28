import 'package:dartz/dartz.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/util/typedef.dart';
import '../../domain/param/get_config_param.dart';
import '../../domain/repository/config_repo.dart';
import '../source/config_data_source.dart';

class ConfigRepo extends IConfigRepo {
  final ConfigDataSource _configDataSource;

  ConfigRepo(this._configDataSource);

  @override
  FutureResult<void> getConfig(GetConfig e) async {
    try {
      await _configDataSource.getConfig(e);
      return const Right(null);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }
}
