import 'package:flutter/material.dart';

import '../../controllers/home_controller/home_controller.dart';
import '../../utils/ui_data.dart';
import '../buttons/raised_gradient_button.dart';
import '../widget_list/category_filter_widget.dart';
import '../widget_list/cusine_filter_widget.dart';
import 'package:get/get.dart';

class BottomSheetDialoge{
 static void settingModalBottomSheet(context) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return GetBuilder<HomeController>(builder: (_) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      UIData.filter,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                const Text(
                  UIData.category,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const FilterCategoryListWidget(),
                SpacingHeight.heightlistspacing10,
                const Text(
                  UIData.recipeType,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                const FilterCusineListWidget(),
                SpacingHeight.heightlistspacing10,
                RaisedGradientButton(
                  gradient: LinearGradient(
                    colors: <Color>[
                      UIDataColors.teal400!,
                      UIDataColors.teal400!,
                    ],
                  ),
                  btntxt: UIData.applyFilter,
                  buttontxtColor: UIDataColors.white,
                  onPressed: () {
                    _.filter();
                    Navigator.pop(context);
                  },
                ),
                SpacingHeight.heightlistspacing20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _.clearFilter();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          UIData.clearFilter,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        )),
                  ],
                ),
              ],
            ).marginOnly(left: 10, right: 10, bottom: 20, top: 20),
          );
        });
      });
}
}