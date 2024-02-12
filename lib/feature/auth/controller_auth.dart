import 'dart:async';

import 'package:get/get.dart';
import 'service_auth.dart';

class AuthController extends GetxController implements GetxService {
  final loading = false.obs;
  final updateMode = false.obs;
  final maintenanceMode = false.obs;
  final authenticated = false.obs;
  StreamSubscription? _subscription;

  final AuthService _service;

  AuthController(this._service);

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

  Future<void> loadData() async {
    try {
      _subscription?.cancel();
      _subscription = _service.listenAuthState((authenticated) {
        this.authenticated.value = authenticated;
        update();
      });
    } catch (e) {

    }
  }
}
