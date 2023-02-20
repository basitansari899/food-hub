import 'package:flutter/cupertino.dart';
import 'package:food_hub/model/category_model.dart';
import 'package:food_hub/model/cusine_model.dart';
import 'package:food_hub/model/food_model.dart';
import 'package:food_hub/utils/ui_data.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<CategoryModel> categoryList = [];
  List<CusineModel> cusineList = [];
  List<FoodModel> foodList = [];

  List<FoodModel> filteredFoodList = [];
  final TextEditingController searchController = TextEditingController();

@override
  void onInit() {
    // setfoodList();
    getFoodList();
    getCategoryList();
    getCusineList();
    super.onInit();
  }



     
     
  Future getFoodList() async {
    final productList = firestore.collection("food_list");
    try {
      await productList.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          final todoModel =
              FoodModel.fromDocumentSnapshot(documentSnapshot: element);
          foodList.add(todoModel);
        }
      });
      filteredFoodList = foodList;
      update();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCategoryList() async {
    final categoryColl = firestore.collection("categories");
    try {
      await categoryColl.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          final category =
              CategoryModel.fromDocumentSnapshot(documentSnapshot: element);
          categoryList.add(category);
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getCusineList() async {
    final cusineColl = firestore.collection("cusine_type");
    try {
      await cusineColl.get().then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          final cusine =
              CusineModel.fromDocumentSnapshot(documentSnapshot: element);
          cusineList.add(cusine);
        }
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
  setfoodList() {
    filteredFoodList = foodList;
    update();
  }

  List<FoodModel> filterByName(List<FoodModel> foodlistone) {
    return searchController.text.isEmpty ? foodlistone: foodlistone
        .where((e) => e.name.toString().toLowerCase().contains(searchController.text.trim().toLowerCase()))
        .toList();
    }

    List<FoodModel> filterByCategory(List<FoodModel> foodlistone) {
      var check = categoryList.any((e) => e.isSelected == true);
     return !check ? foodlistone : foodlistone.where((element) => categoryList.any((e) => e.isSelected == true && e.id == element.catogoryId)).toList();
    }

    List<FoodModel> filterByCusine(List<FoodModel> foodlistone) {
    var check = cusineList.any((e) => e.isSelected == true);
     return !check ? foodlistone : foodlistone.where((element) => cusineList.any((e) => e.isSelected == true && e.id == element.cusineId)).toList();
    }

  void filter() {
    List<FoodModel> setfoodList = filterByName(foodList);
    setfoodList = filterByCategory(setfoodList);
    filteredFoodList = filterByCusine(setfoodList);
    update();
  }

  selectedCategory(int index) {
    categoryList[index].isSelected = !categoryList[index].isSelected;
    update();
  }

  selectedCusine(int index) {
    cusineList[index].isSelected = !cusineList[index].isSelected;
    update();
  }

  clearFilter() {
    filteredFoodList = foodList;
    searchController.clear();
    cusineListReset();
    categoryListReset();
    update();
  }

  cusineListReset() {
    for (var e in cusineList) {
      if (e.isSelected) {
        e.isSelected = false;
      }
    }
    update();
  }

  categoryListReset() {
    for (var e in categoryList) {
      if (e.isSelected) {
        e.isSelected = false;
      }
    }
    update();
  }
}
