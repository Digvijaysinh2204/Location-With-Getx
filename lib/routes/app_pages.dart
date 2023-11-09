import 'package:get/get.dart';
import '../bindings/detail/detail_binding.dart';
import '../bindings/home/home_binding.dart';
import '../views/detail/detail_view.dart';
import '../views/home/home_view.dart';
import '../bindings/splash/splash_binding.dart';
import '../views/splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.detailView,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
