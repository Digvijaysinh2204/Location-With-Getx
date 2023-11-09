import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    nextScreen();
    super.onInit();
  }

  void nextScreen() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(Routes.homeView);
      update();
    });
  }
}
