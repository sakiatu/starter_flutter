import 'package:get/get.dart';
import 'package:starter/feature/config/service_config.dart';

class ConfigController extends GetxController implements GetxService {
  final loading = false.obs;


  final ConfigService _service;

  ConfigController(this._service);

  @override
  void onInit() {

    super.onInit();
  }

  @override
  void onClose() {

    super.onClose();
  }


}
