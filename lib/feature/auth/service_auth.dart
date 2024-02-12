import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../api/api_client.dart';
import '../../helper/local_db.dart';

class AuthService extends GetxService {
  final ApiClient _client;
  final LocalDb _localDb;

  AuthService(this._client, this._localDb);

  StreamSubscription listenAuthState(void Function(bool authenticated) snap) {
    return FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) _localDb.clearAll();
      snap(user != null);
    });
  }
}
