import 'package:cloud_firestore/cloud_firestore.dart';
class CategoryModel{
  String? id;
  String? name;
  bool isSelected = false;
  CategoryModel({required this.id, required this.name});

 CategoryModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot["id"];
    name = documentSnapshot["name"];
  }
}