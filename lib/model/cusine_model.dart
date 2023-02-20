import 'package:cloud_firestore/cloud_firestore.dart';
class CusineModel{
  String? id;
  String? name;
  bool isSelected = false;
  CusineModel({required this.id, required this.name});
  CusineModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot["id"];
    name = documentSnapshot["name"];
  }
}