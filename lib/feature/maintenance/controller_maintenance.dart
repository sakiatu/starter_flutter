import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MaintenanceController extends GetxController implements GetxService {
  final loading = false.obs;

  MaintenanceController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onUpdateClick() async {
    loading.value = true;
    try {
      await launchUrl(Uri.parse('https://google.com'));
    } catch (e) {}
    loading.value = false;
  }
}
