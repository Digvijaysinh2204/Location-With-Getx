import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: SizedBox(
          height: 125,
          width: 125,
          child: Center(
            child: Text("Splash Screen"),
          )),
    ));
  }
}
