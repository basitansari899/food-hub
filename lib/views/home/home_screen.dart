import '../../controllers/home_controller/home_controller.dart';
import '../../utils/ui_data.dart';
import '../../widgets/bottom_sheet/bottom_sheet.dart';
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
                            BottomSheetDialoge.settingModalBottomSheet(context);
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