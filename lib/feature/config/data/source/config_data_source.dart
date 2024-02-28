import '../../domain/param/get_config_param.dart';

import '../../../../core/api/api_client.dart';

class ConfigDataSource{
  final ApiClient _client;
  ConfigDataSource(this._client);

  Future<void> getConfig(GetConfig e) async {
    await _client.query(query: '');
  }
}
