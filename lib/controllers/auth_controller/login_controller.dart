import 'package:flutter/material.dart';
import 'package:food_hub/views/auth_screen/login_screen.dart';
import 'package:get/get.dart';
import '../../utils/routes/app_pages.dart';
import '../../utils/ui_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/snack_bar/common_snackbar.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  bool securetext = true;
  bool isvisible = true;
  GlobalKey<FormState> form = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rememberselect = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  

//Sign in with email and password
  void signInWithEmailAndPassword() async {
    if (form.currentState!.validate()) {
      try{
      final User? user = (await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      ))
          .user;

      if (user != null) {
        Get.toNamed(Routes.homeRoutes);
      } else {
        CommonSnackbar.getSnackbar(
            "Error",
            "Error in Login",
            UIDataColors.red);
      }
      }catch(e){
        print(e);
        CommonSnackbar.getSnackbar(
            "Error",
            "Server Error or Please Check your internet connection",
            UIDataColors.red);
      }
    }
  }
}
