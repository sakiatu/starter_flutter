import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../database/local_db.dart';

class ApiHelper {
  final FirebaseAuth _auth;
  final LocalDb _localDb;

  String? get userId => _localDb.userId;

  String? get token => _localDb.token;

  bool get authorizedUser => _auth.currentUser != null;

  bool get hasToken => _localDb.token != null;

  ApiHelper(this._auth, this._localDb);

  Future<void> refreshToken() async {
    if (_auth.currentUser == null) return;

    final now = DateTime.timestamp().millisecondsSinceEpoch ~/ 1000;
    if (_localDb.tokenExp > now) return;

    await _localDb.saveToken(await _auth.currentUser?.getIdToken(true));
    await _localDb.saveTokenExp(_exp);
  }

  int? get _exp {
    try {
      return jsonDecode(utf8.decode(base64.decode(base64.normalize(token!.split('.')[1]))))['exp'].toInt();
    } catch (e) {
      return null;
    }
  }
}
