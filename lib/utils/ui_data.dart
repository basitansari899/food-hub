library uidata;


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'uidata/textStyles.dart';
part 'uidata/image.dart';

class UIData {
  //strings
  static const String appName ="Food Hub";


  //gneric
  static const String success = "Success";

  
//  Page Orientation Dimentions
  static final double responsiveHeight = (Get.height.ceil()).toDouble();
  static final double responsiveWidth = (Get.width.ceil()).toDouble();



}
