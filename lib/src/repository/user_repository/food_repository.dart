import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerhub/src/features/authentication/models/food_model.dart';

class FoodRepository extends GetxController {
  static FoodRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createFood(FoodModel food) async {
    await _db.collection("foods").add(food.toJson())
    .whenComplete(() => Get.snackbar(
      "Success", "Food has been created", 
      snackPosition: SnackPosition.BOTTOM, 
      backgroundColor: Colors.green))
    .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.red);
    print(error.toString());
    });
  }
}