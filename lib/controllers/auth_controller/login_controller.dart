import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/routes/app_pages.dart';
import '../../utils/routes/app_routes.dart';
import '../../utils/ui_data.dart';

import '../../widgets/snack_bar/common_snackbar.dart';
class LoginController extends GetxController {
  // bool isLoading = true;
  RxBool isLoading = false.obs;
  bool securetext = true;
  bool remember = false;
  bool isvisible = true;
  var roleset;
  final form = GlobalKey<FormState>();
  String  emailstore = "";
  String passwordstore ="";


  List locale = [];
  List userprofilelist = [];

  //     Services

  var userToken;
  var eaToken;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rememberselect = TextEditingController();

  RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  @override
  void onInit() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // emailstore=  prefs.getString("email")!;
    // passwordstore= prefs.getString("password")!;
    locale = [
      {'name': 'English', 'locale': Locale("en", "US")},
      {'name': 'عربي', 'locale': Locale("ar", "SA")}
    ];
    print(emailstore);
    print(emailstore);


    if(emailstore == null || passwordstore ==null) {


      update();
    }else {


      email.text = emailstore.toString();
      password.text= passwordstore.toString();
      update();



    }
    super.onInit();

    update();
    super.onInit();

    update();
  }

  @override
  void onReady() async {
    // await checkfunction();
    // loginfunction();
    // getrole();

    // isLoading = false;
    // update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updatelang(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  void loginfunction() async {
    if (form.currentState!.validate()) {
      Get.toNamed(Routes.homeRoutes);
      isLoading = true.obs;
      update();
      try {
      
        var data = json.decode("{}");

        if (data["success"] == 200) {

          if 
        (data["data"][0]["role"]== "technician") {
            CommonSnackbar.getSnackbar(
                "Technician Error",
                "You do not have permission to perform this action.",
                UIDataColors.red);

                isLoading = false.obs;
          update();
          return;

                
          } 
    
          if (data["success"] == true ||
              data["message"] == "Login Successfull!") {

            CommonSnackbar.getSnackbar(
                "Message", "Login Successfull!", UIDataColors.blue);
          } else if (data["success"] == false ||
              data["message"] == "Error in Login!") {
            // await authService.isloggedincheck();
            CommonSnackbar.getSnackbar(
                "Message", "Error in Login!", UIDataColors.red);
            return;
          }
        }  
        
        
        else if (data["success"] == 400) {

          var error = data["non_field_errors"] == "Unable to log in with provided credentials.";

          if(error==false){

            CommonSnackbar.getSnackbar("non_field_errors",
                "Unable to log in with provided credentials.", UIDataColors.red);


            isLoading = false.obs;
            update();
            return;
          }
          isLoading = false.obs;
          update();
          return;

        } 
         
        isLoading = false.obs;
        update();
        return;
        // await authService.isloggedincheck();
        // roleset = data["agent"]["role"];
        // print(roleset);

        // print("auth ${await authService.isloggedincheck()}");

        // var userData = data["agent"]["token_result"];

      } catch (e) {
        print("check error ${e}");
        isLoading = false.obs;
        update();

        CommonSnackbar.getSnackbar(
            "Server Error",
            "Server Error or Please Check your internet connection",
            UIDataColors.red);
      }
    }
  }
}
