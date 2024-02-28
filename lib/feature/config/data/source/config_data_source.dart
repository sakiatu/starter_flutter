import 'package:starter/core/extension/map.dart';

import '../../../../core/api/api_client.dart';
import '../../domain/param/get_config_param.dart';
import '../model/config_model.dart';

class ConfigDataSource {
  final ApiClient _client;

  ConfigDataSource(this._client);

  Future<List<ConfigModel>> getConfig(GetConfig e) async {
    final res = await _client.query(query: r'''
        query GetConfig{
          config {
            key
            value
          }
        }
      ''');

    if (res.hasError) throw res.error!;

    return res.data.getList('config', (e) => ConfigModel.fromJson(e));
  }
}
