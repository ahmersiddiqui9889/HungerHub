import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hungerhub/src/features/authentication/models/food_model.dart';

class FoodRepository extends GetxController {
  static FoodRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance.collection('foods');

  createFood(FoodModel food) async {
    print("in createfood");
    await _db.add(food.toJson())
    .whenComplete(() { print("Creating food to database"); } )
    .catchError((error, stackTrace) {
    print("Error Occurred");
    print(error.toString());
    });
  }
}