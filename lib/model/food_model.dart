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
}
