import '../../views/splash_screen.dart';
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

    //<-------------- Forgotpassword Page Define ------------------>
    // GetPage(
    //   name: Routes.forgotpasswordRoutes,
    //   page: () => ForgetPasswordScreen(),
    //   binding: ForgotpasswordBinding(),
    // ),

    // GetPage(
    //   name: Routes.homeRoutes,
    //   page: () => HomeScreen(),
    //   binding: HomeBindings(),
    //   // middlewares: [AuthMiddleware()],
    // ),
  ];
}