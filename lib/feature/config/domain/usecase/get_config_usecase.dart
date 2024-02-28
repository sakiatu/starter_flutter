import 'package:starter/core/util/typedef.dart';
import 'package:starter/feature/config/data/model/config_model.dart';
import 'package:starter/feature/config/domain/entity/config_entity.dart';

import '../../../../core/usecase/usecase.dart';

import '../param/get_config_param.dart';
import '../repository/config_repo.dart';

class GetConfigUseCase implements UseCase<Config, GetConfig> {
  final IConfigRepo _configRepo;

  GetConfigUseCase(this._configRepo);

  @override
  FutureResult<Config> call(GetConfig e) => _configRepo.getConfig(e);
}