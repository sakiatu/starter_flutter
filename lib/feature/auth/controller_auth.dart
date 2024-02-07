import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../api/enum_error.dart';
import 'service_auth.dart';

class AuthController extends GetxController implements GetxService {
  final loading = false.obs;
  final updateMode = false.obs;
  final maintenanceMode = false.obs;
  final authenticated = false.obs;
  final error = Rxn<ErrorType>();
  StreamSubscription? _subscription;
  StreamSubscription? _authSubscription;

  final AuthService _service;

  AuthController(this._service);

  @override
  void onInit() {
    _listenAuthState();
    loadData();
    super.onInit();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    _authSubscription?.cancel();
    super.onClose();
  }

  void _listenAuthState() {
    _authSubscription?.cancel();
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      authenticated.value = user != null;
      update();
    });
  }

  void loadData() async {
    loading.value = true;
    error.value = null;

    try {
      _subscription?.cancel();
      _subscription = _service.listenConfig((data, error) {
        // updateMode.value = _needUpdate(data);
        // maintenanceMode.value = _maintenanceMode(data);
        loading.value = false;
        this.error.value = error;
        update();
      });
    } catch (e) {
      error.value = ErrorType.somethingWentWrong;
      update();
    }
  }
}
