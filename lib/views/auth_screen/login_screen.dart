import '../../controllers/auth_controller/login_controller.dart';
import '../../utils/ui_data.dart';
import '../../widgets/buttons/raised_gradient_button.dart';
import '../../widgets/common_scaffold.dart';
import '../../widgets/forms/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  Widget bodyData(context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: Get.height / 1.1,
              ),
              child: Form(
                key: _.form,
                child: Column(
                  children: [

                    SpacingHeight.heightlistspacing35,
                    CommonTextField(
                      textFieldHeading: 'Email Address',
                      controller: _.email,
                      hintText: 'Enter Email Address'.tr,
                      prefixIcon: Icons.email_outlined,
                      isTextHidden: false,
                      fillcolor: UIDataColors.white,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        bool email = _.emailRegex.hasMatch(val);
                        if (val.isEmpty) {
                          return "please enter your email";
                        } else if (email == null) {
                          return "please enter valid email address";
                        }
                      },
                    ),
                    SpacingHeight.heightlistspacing20,
                    CommonTextField(
                      textFieldHeading: 'Password',
                      controller: _.password,
                      hintText: 'Enter Password'.tr,
                      prefixIcon: Icons.lock_outline,
                      keyboardType: TextInputType.text,
                      fillcolor: UIDataColors.white,
                      togglePassword: true,
                      toggleIcon: _.securetext == true
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      toggleFunction: () {
                        _.securetext = !_.securetext;
                        _.update();
                      },
                      isTextHidden: _.securetext,
                      validator: (val) {
                        if (val.isEmpty) {
                          return "password should not be blank";
                        }
                        else if (val.length < 6) {
                          return "password should contains 6 chractors";
                        }
                      },
                    ),
                    SpacingHeight.heightlistspacing20,

                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Obx(
                          () => _.isLoading.value
                              ? const SizedBox(
                                  child: Center(
                                  child: CircularProgressIndicator(),
                                ))
                              : RaisedGradientButton(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      UIDataColors.black,
                                      UIDataColors.black,
                                    ],
                                  ),
                                  btntxt: "Login".tr,
                                  buttontxtColor: UIDataColors.white,
                                  onPressed: () {
                                    _.loginfunction();
                                  },
                                ),
                        ),
                      ),
                    ),
                    SpacingHeight.heightlistspacing35,
                    GestureDetector(
                          onTap: () {
                            // Get.toNamed(Routes.forgotpasswordRoutes);
                          },
                          child: Text("Forgot Password?".tr,
                              style: UIDataTextStyles.forgotPassword),
                        ),
                   
                  ],
                ).marginOnly(left: 20.0, right: 20.0),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showAppBar: true,
      elevation: 0.0,
      appTitle: 'Login',
      appbarcolor: UIDataColors.commonColor,
      appbarstyle: TextStyle(color: UIDataColors.black, fontWeight: FontWeight.w700),
      bodyData: bodyData(context),
      backgroundcolor: UIDataColors.commonColor,
    );
  }
}
