import '../../controllers/auth_controller/login_controller.dart';
import '../../controllers/home_controller/home_controller.dart';
import '../../utils/ui_data.dart';
import '../../widgets/buttons/raised_gradient_button.dart';
import '../../widgets/common_scaffold.dart';
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
                          hintText: 'Search Here',
                          fillcolor: UIDataColors.white,
                          controller: _.searchController,
                          onChanged: (value) {
                            _.setFilterName(value);
                          },
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
                    child: ListView.builder(
                        itemCount: _.filteredFoodList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 6.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0.0, 0.0),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        border: Border.all(
                                          color: Colors.green,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(_.foodList[index].name.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16)),
                                        Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                border: Border.all(
                                                  color: Colors.green,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              _.foodList[index].chefName
                                                  .toString(),
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        ).marginOnly(top: 5)
                                      ],
                                    ).marginOnly(left: 10, bottom: 10, top: 10),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          border: Border.all(
                                            color: Colors.green,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Icon(
                                        Icons.arrow_circle_right_outlined,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ).marginOnly(left: 10, bottom: 10, top: 10),
                          ).marginOnly(bottom: 20);
                        }),
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
      appTitle: 'Search',
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
                  children: [
                    Text(
                      'Filter',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
                Text(
                  'Category',
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
                                BorderRadius.all(Radius.circular(20))),
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
                Text(
                  'Recipie Type',
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
                                BorderRadius.all(Radius.circular(20))),
                        height: 30,
                        width: 70,
                        child: Center(
                            child: Text(
                          _.cusineList[index].name.toString(),
                          style: TextStyle(
                            color: _.cusineList[index].isSelected
                                ? UIDataColors.white
                                : UIDataColors.teal900,
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
                  btntxt: "Apply Filter".tr,
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
                        child: Text(
                          'Clear Filter',
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

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ListView.builder")),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing: const Text(
                  "GFG",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          }),
    );
  }
}
