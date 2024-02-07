import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:starter/api/enum_error.dart';

import '../../api/api_client.dart';

class AuthService extends GetxService {
  final ApiClient _client;

  AuthService(this._client);

  StreamSubscription listenConfig(void Function(Map map, ErrorType? erorr) snap) {
    Map cacheData = {};
    return _client.subscription(
      query: r'''
        subscription {
          config {
            key
            value
          }
        }
      ''',
      snap: (res) {
        final data = {for (var item in res.data['config'] ?? []) item['key']: item['value']};

        if (res.cacheError) return;
        if (res.hasError) return snap(cacheData, ErrorType.somethingWentWrong);

        if (res.cache || res.network && !mapEquals(cacheData, data)) {
          snap(data, null);
          cacheData = {...data};
        }
      },
    );
  }
}
