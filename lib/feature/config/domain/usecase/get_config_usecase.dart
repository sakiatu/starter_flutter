import '../../../../core/usecase/usecase.dart';

import '../param/get_config_param.dart';
import '../repository/config_repo.dart';

class GetConfigUseCase implements UseCase<void, GetConfig> {
  final IConfigRepo _configRepo;

  GetConfigUseCase(this._configRepo);

  @override
  Future<void> call(GetConfig e) => _configRepo.getConfig(e);
}