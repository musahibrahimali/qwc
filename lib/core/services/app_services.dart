import 'package:get/get.dart';
import 'package:qwc/index.dart';

class ServiceInitializer {
  ServiceInitializer._();
  static final ServiceInitializer instance = ServiceInitializer._();

  initServices() async {
    await dataLayer();
  }

  Future<void> dataLayer() async {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => DataController());
  }
}
