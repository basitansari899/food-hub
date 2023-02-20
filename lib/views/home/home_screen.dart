import 'package:food_hub/model/food_model.dart';

import '../../controllers/auth_controller/login_controller.dart';
import '../../controllers/home_controller/home_controller.dart';
import '../../utils/ui_data.dart';
import '../../widgets/buttons/raised_gradient_button.dart';
import '../../widgets/common_scaffold.dart';
import '../../widgets/forms/food_list_widget.dart';
import '../../widgets/forms/text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  Widget bodyData(context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: Get.height / 1.1,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: CommonTextField(
                          isTextHidden: false,
                          prefixIcon: Icons.search,
                          hintText: UIData.searchHere,
                          fillcolor: UIDataColors.white,
                          controller: _.searchController,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            _settingModalBottomSheet(context);
                          },
                          child: Container(
                            height: 45,
                            width: 20,
                            decoration: BoxDecoration(
                              color: UIDataColors.teal400,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: Center(
                                child: Icon(
                              Icons.menu_open,
                              color: UIDataColors.white,
                            )),
                          ).marginOnly(left: 10, top: 10),
                        ),
                      )
                    ],
                  ),
                  SpacingHeight.heightlistspacing10,
                  SizedBox(
                    height: Get.height / 1.3,
                    child: FoodList(filteredFoodList: _.filteredFoodList),
                  ),
                ],
              ).marginOnly(left: 20.0, right: 20.0),
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
      appTitle: UIData.serchHeading,
      backarrow: UIDataColors.black,
      appbarcolor: UIDataColors.commonColor,
      appbarstyle:
          TextStyle(color: UIDataColors.black, fontWeight: FontWeight.w700),
      bodyData: bodyData(context),
      backgroundcolor: UIDataColors.commonColor,
    );
  }
}

void _settingModalBottomSheet(context) {
  showModalBottomSheet(
      // isScrollControlled: true,
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
                Wrap(
                  children:
                      //  <Widget>[
                      List.generate(_.categoryList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _.selectedCategory(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: _.categoryList[index].isSelected
                                ? UIDataColors.teal400!
                                : UIDataColors.grey200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        height: 30,
                        width: 70,
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
                ),
                SpacingHeight.heightlistspacing10,
                const Text(
                  UIData.recipeType,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: List.generate(_.cusineList.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        _.selectedCusine(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: _.cusineList[index].isSelected
                                ? UIDataColors.teal400!
                                : UIDataColors.grey200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        height: 30,
                        width: 70,
                        child: Center(
                            child: Text(
                          _.cusineList[index].name.toString(),
                          style: TextStyle(
                            color: _.cusineList[index].isSelected
                                ? UIDataColors.white
                                : UIDataColors.teal900,
                                fontSize: 12
                          ),
                        )),
                      ).marginAll(10),
                    );
                  }),
                ),
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