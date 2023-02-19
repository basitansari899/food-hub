import 'dart:ui';

import 'package:get/get.dart';
import '../../utils/ui_data.dart';

class CommonSnackbar
{
  static void getSnackbar(String title, String message, Color snackbarColor) {
    Get.snackbar(
      title,
      message,
      colorText: UIDataColors.white,
      backgroundColor: snackbarColor,
    );
  }
}