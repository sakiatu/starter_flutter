import '../../../../core/util/typedef.dart';
import '../entity/config_entity.dart';
import '../param/get_config_param.dart';

abstract class IConfigRepo {
  FutureResult<Config> getConfig(GetConfig e);
}