import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/routes/app_pages.dart';
import '../../views/auth_screen/login_screen.dart';

class SignOutController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future signOut() async {
    try {
      
     await _auth.signOut();
     Get.offAllNamed(Routes.loginRoutes);
     print("signout");
    } catch (e) {
      print(e);
      return null;
    }
  }
}