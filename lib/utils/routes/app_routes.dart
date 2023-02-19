import '../../views/auth_screen/login_screen.dart';
import '../../views/home/home_screen.dart';
import '../../views/splash_screen.dart';
import '../bindings/auth_binding/login_binding.dart';
import '../bindings/home_binding/home_binding.dart';
import '../bindings/splash_binding/splash_binding.dart';
import 'app_pages.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.splashRoutes;

  static final routes = [
    // < -------------------- Splash Page ----------------->
    GetPage(
      name: Routes.splashRoutes,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),

    //<-------------- Auth Page Define ------------------>
    GetPage(
      name: Routes.loginRoutes,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: Routes.homeRoutes,
      page: () => HomeScreen(),
      binding: HomeBindings(),
      // middlewares: [AuthMiddleware()],
    ),
  ];
}