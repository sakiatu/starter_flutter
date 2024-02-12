import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../api/api_client.dart';

class ConfigService extends GetxService {
  final ApiClient _client;

  ConfigService(this._client);

  StreamSubscription listenConfig(void Function(Map map) snap) {
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
        if (res.hasError) throw res.error!;

        if (res.cache || res.network && !mapEquals(cacheData, data)) {
          snap(data);
          cacheData = {...data};
        }
      },
    );
  }
}
