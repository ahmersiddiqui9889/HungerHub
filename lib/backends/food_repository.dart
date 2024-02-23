import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hungerhub/backends/food_model.dart';

class FoodRepository extends GetxController {
  static FoodRepository get instance => Get.find();

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final CollectionReference _db = FirebaseFirestore.instance.collection('foods');

  Future<String> uploadImageToStorage(String childName, Uint8List? file) async {
    print("in upload image");
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future uploadFoodToFirebase(FoodModel food) async {
    print("uploading foood");
    await _db.add(food.toJson())
    .whenComplete(() { print("Created food to database"); } )
    .catchError((error, stackTrace) {
    print("Error Occurred");
    print(error.toString());
    return error;
    });
  }

}