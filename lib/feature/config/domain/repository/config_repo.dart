import '../../../../core/util/typedef.dart';
import '../param/get_config_param.dart';

abstract class IConfigRepo {
  FutureResult<void> getConfig(GetConfig e);
}