import 'package:cloud_firestore/cloud_firestore.dart';
class FoodModel {
  String? id;
  String? name;
  String? catogoryId;
  String? cusineId;
  String? chefName;
  String? imageString;

  FoodModel(
      {required this.id,
      required this.name,
      required this.imageString,
      required this.catogoryId,
      required this.cusineId,
      required this.chefName});

    FoodModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot["id"];
    name = documentSnapshot["name"];
    catogoryId = documentSnapshot["category_id"];
    cusineId = documentSnapshot["cusine_id"];
    chefName = documentSnapshot["chef_name"];
    imageString = documentSnapshot["image_string"];
  }
}
