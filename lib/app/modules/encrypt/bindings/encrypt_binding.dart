import 'package:get/get.dart';

import '../controllers/encrypt_controller.dart';

class EncryptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EncryptController>(
      () => EncryptController(),
    );
  }
}
