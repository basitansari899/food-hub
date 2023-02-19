
import 'package:get/get.dart';

import '../utils/routes/app_pages.dart';




class SplashController extends GetxController {

  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3), () {
            Get.offAndToNamed(Routes.loginRoutes);
          });

    update();
    super.onInit();
  }


}
