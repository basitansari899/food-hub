library uidata;


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
part 'uidata/textStyles.dart';
part 'uidata/image.dart';
part 'uidata/spacingwidth.dart';
part 'uidata/spacingheight.dart';
part 'uidata/color.dart';
class UIData {
  //strings
  static const String appName ="Food Hub";
  static const String filter ="Filter";
  static const String category ="Category";
  static const String recipeType ="Recipie Type";
  static const String applyFilter ="Apply Filter";
  static const String clearFilter ="Clear Filter";
  static const String serchHeading ="Search";
  static const String searchHere ="Search Here";


  //gneric
  static const String success = "Success";

  
//  Page Orientation Dimentions
  static final double responsiveHeight = (Get.height.ceil()).toDouble();
  static final double responsiveWidth = (Get.width.ceil()).toDouble();



}
