import 'package:flutter/cupertino.dart';
import 'package:food_hub/model/category_model.dart';
import 'package:food_hub/model/cusine_model.dart';
import 'package:food_hub/model/food_model.dart';
import 'package:food_hub/utils/ui_data.dart';
import 'package:get/get.dart';
class HomeController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(id:'cat1',name:'Breakfast',isSelected: false),
    CategoryModel(id:'cat2',name:'Lunch',isSelected: false),
    CategoryModel(id:'cat3',name:'Dinner',isSelected: false),
  ];
  List<CusineModel> cusineList = [
    CusineModel(id:'cus1',name:'Salad',isSelected: false),
    CusineModel(id:'cus2',name:'Egg',isSelected: false),
    CusineModel(id:'cus3',name:'Cakes',isSelected: false),
    CusineModel(id:'cus4',name:'Chicken',isSelected: false),
    CusineModel(id:'cus5',name:'Meals',isSelected: false),
    CusineModel(id:'cus6',name:'Vegitables',isSelected: false),
  ];
   List<FoodModel> foodList = [
    FoodModel(id:'food1',name:'Easy Home Made Burger',catogoryId: "cat1",cusineId: "cus1",chefName: "James Spader", imageString: UIDataImage.foodone),
    FoodModel(id:'food2',name:'Easy Home ',catogoryId: "cat2",cusineId: "cus2",chefName: "Jhon", imageString: UIDataImage.food2),
    FoodModel(id:'food3',name:'Easy Home  Burger',catogoryId: "cat2",cusineId: "cus3",chefName: "Doe", imageString: UIDataImage.food3),
    FoodModel(id:'food4',name:'Easy  Made Burger',catogoryId: "cat3",cusineId: "cus4",chefName: "Lisa", imageString: UIDataImage.food44),
    FoodModel(id:'food5',name:'Easy Home Made Beef Burger',catogoryId: "cat3",cusineId: "cus5",chefName: "Collin", imageString: UIDataImage.food66),
    FoodModel(id:'food6',name:' Home Made Burger',catogoryId: "cat3",cusineId: "cus6",chefName: "Ferram", imageString: UIDataImage.foodone),
    FoodModel(id:'food7',name:' Made Burger',catogoryId: "cat1",cusineId: "cus1",chefName: "Kehram", imageString: UIDataImage.food2),
    FoodModel(id:'food8',name:'Easy Home Made Burger',catogoryId: "cat2",cusineId: "cus2",chefName: "Lonchino", imageString: UIDataImage.food3),
    FoodModel(id:'food9',name:'Easy Burger',catogoryId: "cat3",cusineId: "cus3",chefName: "fintash", imageString: UIDataImage.food44),
    FoodModel(id:'food10',name:'Egg fried',catogoryId: "cat2",cusineId: "cus4",chefName: "Albert", imageString: UIDataImage.food66),
    FoodModel(id:'food11',name:'ginger egg',catogoryId: "cat1",cusineId: "cus5",chefName: "Jasica", imageString: UIDataImage.foodone),
  ];

List<FoodModel> filteredFoodList = [];
String filterName = '';
final TextEditingController searchController = TextEditingController();

@override
  void onInit() {
    setfoodList();
    super.onInit();
  }

  setfoodList() {
    filteredFoodList = foodList;
    update();
  }

  List<FoodModel> filterByName(List<FoodModel> foodlistone) {
    return filterName.isEmpty ? foodlistone: foodlistone
        .where((e) => e.name.toString().toLowerCase().contains(filterName.trim().toLowerCase()))
        .toList();
    }
    List<FoodModel> filterByCategory(List<FoodModel> foodlistone) {
      var check = categoryList.any((e) => e.isSelected == true);
      print(check);
     return !check ? foodlistone : foodlistone.where((element) => categoryList.any((e) => e.isSelected == true && e.id == element.catogoryId)).toList();
    }
    List<FoodModel> filterByCusine(List<FoodModel> foodlistone) {
    var check = cusineList.any((e) => e.isSelected == true);
    print(check);
     return !check ? foodlistone : foodlistone.where((element) => cusineList.any((e) => e.isSelected == true && e.id == element.cusineId)).toList();
  }

  void filter() {
    List<FoodModel> setfoodList = filterByName(foodList);
    setfoodList = filterByCategory(setfoodList);
    filteredFoodList = filterByCusine(setfoodList);
    update();
    print(filteredFoodList.length);
  }

  setFilterName(String value) {
    filterName = value;
    update();
    filter();
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
    filterName = '';
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
