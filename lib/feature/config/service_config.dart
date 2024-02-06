import 'package:get/get.dart';
import '../../api/api_client.dart';

class ConfigService extends GetxService {
  final ApiClient _client;

  ConfigService(this._client);

  Future<void> fetch(void Function(Map map) snap) async {
    await _client.queryCacheNetwork(
        query: '',
        variables: {"":'' },
        snap: (res) {
          if (res.cacheError) return;
          if (res.hasError) throw res.error;
          snap({});
        });
  }
}
