import 'package:flutter/material.dart';

import '../../controllers/home_controller/home_controller.dart';
import '../../utils/ui_data.dart';
import 'package:get/get.dart';

class FilterCategoryListWidget extends StatelessWidget {
  const FilterCategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: List.generate(_.categoryList.length, (index) {
          return GestureDetector(
            onTap: () {
              _.selectedCategory(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: _.categoryList[index].isSelected
                      ? UIDataColors.teal400!
                      : UIDataColors.grey200,
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: 30,
              width: 90,
              child: Center(
                  child: Text(
                _.categoryList[index].name.toString(),
                style: TextStyle(
                    color: _.categoryList[index].isSelected
                        ? UIDataColors.white
                        : UIDataColors.teal900,
                    fontSize: 12),
              )),
            ).marginAll(10),
          );
        }),
      );
    });
  }
}