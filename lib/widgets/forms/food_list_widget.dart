import 'package:flutter/material.dart';

import '../../model/food_model.dart';
import '../../utils/ui_data.dart';
import 'package:get/get.dart';

class FoodList extends StatelessWidget {
  final List<FoodModel> filteredFoodList;
  const FoodList({Key? key, required this.filteredFoodList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: filteredFoodList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0.0, 0.0),
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
                        image: DecorationImage(
                          image: AssetImage(
                              filteredFoodList[index].imageString.toString()),
                          fit: BoxFit.fill,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(filteredFoodList[index].name.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(filteredFoodList[index]
                                      .imageString
                                      .toString()),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              filteredFoodList[index].chefName.toString(),
                              style: TextStyle(
                                  fontSize: 12, color: UIDataColors.grey600),
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
                          color: UIDataColors.teal400,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ).marginOnly(left: 10, bottom: 10, top: 10),
          ).marginOnly(bottom: 20);
        });
  }
}
