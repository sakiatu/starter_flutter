import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateController extends GetxController implements GetxService {
  final loading = false.obs;

  Future<void> onUpdateClick(String link) async {
    loading.value = true;
    try {
      await launchUrl(Uri.parse(link));
    } catch (e) {}
    loading.value = false;
  }
}
