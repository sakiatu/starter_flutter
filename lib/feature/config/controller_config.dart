import 'dart:async';
import 'dart:io' show Platform;

import 'package:get/get.dart';
import 'package:starter/const/config.dart';

import 'service_config.dart';

class ConfigController extends GetxController implements GetxService {
  final loading = false.obs;
  final updateMode = false.obs;
  final maintenanceMode = false.obs;
  final authenticated = false.obs;
  final error = Rxn<String>();
  String appLink = '';
  StreamSubscription? _subscription;

  final ConfigService _service;

  ConfigController(this._service);

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  void loadData() async {
    loading.value = true;
    error.value = null;

    try {
      _subscription?.cancel();
      _subscription = _service.listenConfig((data) {
        updateMode.value = _needUpdate(data);
        maintenanceMode.value = _maintenanceMode(data);
        loading.value = false;
        update();
      });
    } catch (e) {
      error.value = e.toString();
      update();
    }
  }

  bool _needUpdate(Map data) {
    double minimum = 0;

    if (Platform.isAndroid) {
      minimum = double.tryParse(data['minimum_android_version'] ?? '0') ?? 0;
      appLink = data['android_link'] ?? '';
    } else if (Platform.isIOS) {
      minimum = double.tryParse(data['minimum_ios_version'] ?? '0') ?? 0;
      appLink = data['ios_link'] ?? '';
    }

    return MyConfig.appVersion < minimum;
  }

  bool _maintenanceMode(Map data) => bool.tryParse('${data['maintenance']}'.toLowerCase()) ?? false;
}
