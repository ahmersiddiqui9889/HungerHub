class FoodModel {
  final String? id;
  final String foodName;
  final String produced;
  final String expiry;
  final String quantity;

  const FoodModel({
    this.id,
    required this.foodName,
    required this.produced,
    required this.expiry,
    required this.quantity,
  });

  toJson() {
    return{
      "foodName": foodName,
      "produced": produced,
      "expiry": expiry,
      "quantity": quantity,
    };
  }

}