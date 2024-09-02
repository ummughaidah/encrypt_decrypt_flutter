import 'package:get/get.dart';

import '../modules/encrypt/bindings/encrypt_binding.dart';
import '../modules/encrypt/views/encrypt_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/token/bindings/token_binding.dart';
import '../modules/token/views/token_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ENCRYPT,
      page: () => const EncryptView(),
      binding: EncryptBinding(),
    ),
    GetPage(
      name: _Paths.TOKEN,
      page: () => const TokenView(),
      binding: TokenBinding(),
    ),
  ];
}
